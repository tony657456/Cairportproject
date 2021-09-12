package com.cos.webproject.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cos.webproject.domain.user.User;
import com.cos.webproject.domain.user.UserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class TestController {
	private final UserRepository userRepository;

	@GetMapping("/formtest")
	public String agreeForm() {
		return "test/joinFormtest";
	}
	
	@PostMapping("/joincompletetest")
	public @ResponseBody User joincomplete(User user) {
		User userEntity = userRepository.save(user);
		return userEntity;
	}
	
	@PostMapping("/logintest")
	public @ResponseBody String logintest(User user) {
		String username = user.getUsername();
		String userpassword = user.getPassword();
		System.out.println(username);
		System.out.println(userpassword);
		return"ok";
	}
	
	@GetMapping("/maintest")
	public String maintestForm() {
		return "test/maintest";
	}
	
//	@PostMapping("/maintest")
//	public @ResponseBody String maintest(PlaneTicket planeTicket) {
//		String dep = planeTicket.get();
//		System.out.println(dep);
//		return "ok";
//	}
//}
	

}
