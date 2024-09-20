package kr.or.ddit.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/web/logout.do")
@Controller
public class LogoutController {

	@PostMapping
	public String logout(HttpSession session) {
		// 세션 만료시킴
		session.invalidate();

		// 웰컴페이지로 이동
		return "redirect:web/home.do";
	}
}
