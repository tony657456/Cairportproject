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
	
	@PostMapping("/user/ticketgo")
	public String ticketgo(TicketReqDto ticketReqDto, Model model) {
		String a = ticketReqDto.getDepplandtime();
		String b = ticketReqDto.getArrplandtime();
		String parsegetDepplandtime = a.replaceAll("-", "");
		String parsegetArrplandtime = b.replaceAll("-", "");
		ticketReqDto.setDepplandtime(parsegetDepplandtime);
		ticketReqDto.setArrplandtime(parsegetArrplandtime);
		
		// 해당 정보는 유저가 선택한 출발일, 도착일, 출발공항, 도착공항에 정보를 들고 있다.
		session.setAttribute("ticketReqDto", ticketReqDto);
	
        try {
           String result = KimHaeJejuDataDownload.goAirport(ticketReqDto);
           Gson gson = new Gson();
           AirportDto airportDto = gson.fromJson(result, AirportDto.class);
           
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
		
		// 사용자가 선택한 가는곳과 오는곳의 정보를 토대로 공공데이터를 받아와야 하니까 그 정보를 session에 담아줘서 가져 옴
		TicketReqDto ticketReqDto = (TicketReqDto) session.getAttribute("ticketReqDto");
		
		// 시간의 "-"를 없애는 과정
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
	
	// 좌석을 선택하는 순간 이 컨트롤러가 작동해서 선택한 정보를 세션에 담아줌
	@PostMapping("/user/go")
	public @ResponseBody String data1(@RequestBody TicketGoBackDto ticketgoDto) {
		session.setAttribute("go", ticketgoDto);
		return "ok";
	}

	// 가는편이랑 동등
	@PostMapping("/user/back")
	public @ResponseBody String data2(@RequestBody TicketGoBackDto ticketgoDto) {
		session.setAttribute("back", ticketgoDto);
		return "ok";
	}
}
