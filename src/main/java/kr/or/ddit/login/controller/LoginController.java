package kr.or.ddit.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/web/login.do")
@Controller
public class LoginController {
	@GetMapping
	public String doGet() {
		return "wiles:login/login";
	}

}
