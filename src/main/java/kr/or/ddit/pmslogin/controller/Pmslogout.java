package kr.or.ddit.pmslogin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("pmslogout.do")
@Controller
public class Pmslogout {

	@PostMapping
	public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
		session.invalidate();
		return "redirect:/pmslogin.do";
	}
}
