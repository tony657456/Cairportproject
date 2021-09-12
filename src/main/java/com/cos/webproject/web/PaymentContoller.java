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
