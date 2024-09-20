package kr.or.ddit.pmslogin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.vo.EmpVO;

@RequestMapping("pmslogin.do")
@Controller
public class Pmslogin {
	@Autowired
	private EmpService service;

	@GetMapping
	public String mypage() {
	 return "pms/login/pmslogin";
	}

	@PostMapping
	public String login(@ModelAttribute("emp") EmpVO emp, RedirectAttributes redirectAttributes, HttpSession session) {
		EmpVO empvo = service.retrieveEmp(emp.getEmpId());
		if(empvo == null) {
			return "redirect:/pmslogin.do";
		}else {
			if(empvo.getEmpPw().equals(emp.getEmpPw())){
				session.setAttribute("empvo", empvo);
				return "redirect:/index.do";
			}else {
				return "redirect:/pmslogin.do";
			}
		}

	}
	
}