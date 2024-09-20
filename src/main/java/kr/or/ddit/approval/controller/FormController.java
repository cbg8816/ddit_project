package kr.or.ddit.approval.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.approval.service.ApprovalFormService;
import kr.or.ddit.vo.AttencanceVO;
import kr.or.ddit.vo.EmpVO;

@Controller
@RequestMapping("/approval")
public class FormController {

	@Autowired
	private ApprovalFormService approserivce;

	@GetMapping("/transportation_request.do")
	public String transport(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmpVO empvo = (EmpVO)session.getAttribute("empvo");
		model.addAttribute("empvo", empvo);
		return "pms/approval/transportation_request";
	}


	@GetMapping("/hoilday_work.do")
	public String holiday(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmpVO empvo = (EmpVO)session.getAttribute("empvo");
		model.addAttribute("empvo", empvo);
		return "pms/approval/holiday_work_request";
	}


}
