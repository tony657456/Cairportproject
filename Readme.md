#티켓 예약 코드
```java
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
```

#회원가입 로그인
```java
package com.cos.webproject.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.webproject.domain.user.User;
import com.cos.webproject.domain.user.UserRepository;
import com.cos.webproject.web.dto.UsernameCheckDto;

import lombok.RequiredArgsConstructor;
;

@RequiredArgsConstructor
@Controller
public class UserController {
	private final UserRepository userRepository;
	private final HttpSession session;
	
	@GetMapping({"/", "main"})
	public String mainForm() {
		return "main/mainForm";
	}
	
	@GetMapping("/auth/agreeForm")
	public String agreeForm() {
		return "auth/agreeForm";
	}

	@GetMapping("/auth/joinForm")
	public String joinForm() {
		return "auth/joinForm";
	}
	
	@GetMapping("/auth/loginForm")
	public String loginForm() {
		return "auth/loginForm";
	}
	
	@GetMapping("/auth/joinendForm")
	public String joinend() {
		return "auth/join-end";
	}
	
	@GetMapping("/user/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/auth/login")
	public String cloginForm(User user) {
		System.out.println("username : "+user.getUsername());
		System.out.println("password : "+user.getPassword());
		User userEntity = userRepository.mLogin(user.getUsername(), user.getPassword());
		if(userEntity == null) {
			return "redirect:/auth/loginForm";
		} else {
			session.setAttribute("principal", userEntity);
			return "redirect:/";
		}
	}
	
	@PostMapping("/auth/joincomplete")
	public String joincomplete(User user) {  
		userRepository.save(user);
		return "redirect:/auth/joinendForm";
	}
	
	@PostMapping("/auth/usernamecheck")
	public @ResponseBody String usernamecheck(@RequestBody UsernameCheckDto usernameCheckDto) {
		// findAll()하려면 컬렉션 형태에 담아줘야 함.
		User userEntity = userRepository.mFindUsername(usernameCheckDto.getUsername());
		System.out.println(userEntity);
		if(userEntity == null) {
			return "ok";
		} else {
			return "false";
		}
	}
	

}

```

#예약 내역
```java
package com.cos.webproject.web;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.cos.webproject.domain.payment.Payment;
import com.cos.webproject.domain.payment.PaymentRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class PaymentContoller {
	
	private final PaymentRepository paymentRepository;
	
	// 똑같은 외래키를 참조 할 방법은 List 형식으로 만들어서 뽑아오는 방법뿐이다.
	@GetMapping("/user/ticketcheck/{id}")
	public String payment(Model model, @PathVariable int id) {
		List<Payment> paymentEntity = paymentRepository.mFindpayment(id);
		model.addAttribute("payments", paymentEntity);
		return "reservation/ticket-check";
	}
	
	@GetMapping("/user/checkin/{id}")
	public String checkin(Model model, @PathVariable int id) {
		List<Payment> checkinEntity = paymentRepository.mFindpayment(id);
		model.addAttribute("checkins", checkinEntity);
		return "check/check-in";
	}
	
	
}

```