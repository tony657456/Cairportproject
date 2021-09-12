package com.cos.webproject.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.webproject.domain.payment.Payment;
import com.cos.webproject.domain.payment.PaymentRepository;
import com.cos.webproject.domain.planeticket.PlaneTicket;
import com.cos.webproject.domain.planeticket.PlaneTicketRepository;
import com.cos.webproject.domain.user.User;
import com.cos.webproject.dto.AirportDto;
import com.cos.webproject.utils.KimHaeJejuDataDownload;
import com.cos.webproject.web.dto.TicketReqDto;
import com.cos.webproject.web.dto.TicketGoBackDto;
import com.google.gson.Gson;

import lombok.RequiredArgsConstructor;



@RequiredArgsConstructor
@Controller
public class PlaneTicketController {
	
	private final HttpSession session;
	private final PlaneTicketRepository planeticketrepository;
	private final PaymentRepository paymentRepository;
	
	@GetMapping("/ticketForm")
	public String ticketForm(){
		return "reservation/ticketForm";
	}
	
	@GetMapping("/user/checkQr")
	public String checkQr() {
		return "check/check-qr";
	}
	
	@GetMapping("/travelForm")
	public  String travelForm() {
		return "travel/travelForm";
	}
	
	// 1. 사용자의 요청을 받으면 일단 dto랑 비교해서 출력하고 싶은데 dto랑 비교하는게 너무 어렵다.... 차라리 내 데이터 베이스에 데이터 다 넣어놓고 비교하는게 쉬움.
	// 그리고 ticketgo 페이지는 하나인데 김해 제주꺼만 받아와서 비교할 수 없음.
	// 2. 출발지, 도착지 등을 받아서 데이터베이스랑 비교 한 다음 데이터를 뿌려줘야 하는데 Dto를 아직 데이터베이스에 넣어야지 요청을 받고 데이터를 뿌려줄 수 있다.
	// 3. planeticketrepository에서 검색하면 데이터 받아와서 뿌려줘야 하는데 쿼리문이 출발지 도착지를 두개를 가져와서 요청한 값이랑 맞으면 뿌려줘야 하는데
	// AND도 아니고 OR도 아니고 두개의 값이 다 같으면 찾아서 뿌려주는 쿼리문이 필요하다.
	@PostMapping("/user/ticketgo")
	public String ticketgo(TicketReqDto ticketReqDto, Model model) {
		
		// 1번 PlaneTicket 제대로 받아야함. (날짜데이터를 자바에서 어떻게 받는지 잘모르겠다) - 해결
		// 2번 잘받았는데 busan seoul 이 아니라 코드값이 필요
		// 3번 잘받았는데 날짜에 작대기를 없애야함.
		String a = ticketReqDto.getDepplandtime();
		String b = ticketReqDto.getArrplandtime();
		String parsegetDepplandtime = a.replaceAll("-", "");
		String parsegetArrplandtime = b.replaceAll("-", "");
		ticketReqDto.setDepplandtime(parsegetDepplandtime);
		ticketReqDto.setArrplandtime(parsegetArrplandtime);
		
		// 해당 정보는 유저가 선택한 출발일, 도착일, 출발공항, 도착공항에 정보를 들고 있다.
		session.setAttribute("ticketReqDto", ticketReqDto);
	
		// 2번 받은데이터를 토대로 api 요청
		
        try {
           String result = KimHaeJejuDataDownload.goAirport(ticketReqDto);
           Gson gson = new Gson();
           AirportDto airportDto = gson.fromJson(result, AirportDto.class);
           // 공공데이터를 받아와서 뿌리는거는 리스트형식이라 뿌리면 되는데
           // 얘는 사용자가 가고싶은 목적지를 뿌려줘야하기 때문에 
           
           // 해당 정보는 리스트에서 유저가 선택한 정보
           model.addAttribute("goairportListDto", airportDto.getResponse().getBody().getItems().getItem());
           return "reservation/ticket-go";
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
       return null;
	}
	
	
	@GetMapping("/user/ticketreturn")
	public String ticketreturn(Model model) {
		
		TicketReqDto ticketReqDto = (TicketReqDto) session.getAttribute("ticketReqDto");
		
		String a = ticketReqDto.getDepplandtime();
		String b = ticketReqDto.getArrplandtime();
		String parsegetDepplandtime = a.replaceAll("-", "");
		String parsegetArrplandtime = b.replaceAll("-", "");
		ticketReqDto.setDepplandtime(parsegetDepplandtime); 
		ticketReqDto.setArrplandtime(parsegetArrplandtime);
	
        try {
           String result = KimHaeJejuDataDownload.backAirport(ticketReqDto);
           Gson gson = new Gson();
           AirportDto airportDto = gson.fromJson(result, AirportDto.class);
           model.addAttribute("backairportListDto", airportDto.getResponse().getBody().getItems().getItem());
           return "reservation/ticket-return";
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
       return null;
	}
	
	@GetMapping("/user/payForm")
	public String payForm(PlaneTicket planeTicket, Model model) {
		TicketGoBackDto ticketGoBackDto = (TicketGoBackDto) session.getAttribute("go");
		TicketGoBackDto ticketGoBackDto2 = (TicketGoBackDto) session.getAttribute("back");
		int goprice = ticketGoBackDto.getPrice();
		int backprice = ticketGoBackDto2.getPrice();
		int gobackprice = goprice + backprice;
		model.addAttribute("GoBackPrice", gobackprice);
		
		return "reservation/payForm";
	}
	
	@GetMapping("/user/pay")
	public String pay() {
		TicketGoBackDto ticketGoBackDto = (TicketGoBackDto) session.getAttribute("go");
		TicketGoBackDto ticketGoBackDto2 = (TicketGoBackDto) session.getAttribute("back");
		User principal = (User)session.getAttribute("principal");
		
		// 1. 가는편 db에 저장
		PlaneTicket planeTicket = new PlaneTicket();
		planeTicket.setDepairportnm(ticketGoBackDto.getDepairportnm());
		planeTicket.setArrairportnm(ticketGoBackDto.getArrairportnm());
		planeTicket.setDepplandtime(ticketGoBackDto.getDepplandtime());
		planeTicket.setArrplandtime(ticketGoBackDto.getArrplandtime());
		planeTicket.setPrice(ticketGoBackDto.getPrice());
		planeTicket.setVihicleId(ticketGoBackDto.getVihicleId());
		
		planeticketrepository.save(planeTicket);
		Payment payment = new Payment();
		payment.setPlaneTicket(planeTicket);
		payment.setUser(principal);
		paymentRepository.save(payment);
		
		// 2. 오는편 db에 저장
		planeTicket = new PlaneTicket();
		planeTicket.setDepairportnm(ticketGoBackDto2.getDepairportnm());
		planeTicket.setArrairportnm(ticketGoBackDto2.getArrairportnm());
		planeTicket.setDepplandtime(ticketGoBackDto2.getDepplandtime());
		planeTicket.setArrplandtime(ticketGoBackDto2.getArrplandtime());
		planeTicket.setPrice(ticketGoBackDto2.getPrice());
		planeTicket.setVihicleId(ticketGoBackDto2.getVihicleId());
		
		planeticketrepository.save(planeTicket);
		payment = new Payment();
		payment.setPlaneTicket(planeTicket);
		payment.setUser(principal);
		paymentRepository.save(payment);
		return "redirect:/";
	}
	
	@PostMapping("/user/go")
	public @ResponseBody String data1(@RequestBody TicketGoBackDto ticketgoDto) {
		session.setAttribute("go", ticketgoDto);
		return "ok";
	}

	
	@PostMapping("/user/back")
	public @ResponseBody String data2(@RequestBody TicketGoBackDto ticketgoDto) {
		session.setAttribute("back", ticketgoDto);
		return "ok";
	}
	
	
//    @GetMapping("/airport")
//    public String airport(Model model) {
//        try {
//            String result = KimHaeJejuDataDownload.goAirport();
//            Gson gson = new Gson();
//            AirportDto airportDto = gson.fromJson(result, AirportDto.class);
//            System.out.println(airportDto);
//            model.addAttribute("airportListDto", airportDto.getResponse().getBody().getItems().getItem());
//            return "reservation/ticket-go";
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//        return null;
//    }
}
