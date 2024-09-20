package kr.or.ddit.empnotice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.empnotice.service.EmpNoticeService;

@Controller
public class EmpNoticeDeleteController {

	@Autowired
	public EmpNoticeService service;

	@GetMapping("/empNotice/empNoticeDelete.do")
	public String delete(Model model, @RequestParam String what) {

		service.removeEmpNotice(what);

		return "redirect:empNoticeList.do";
	}
}
