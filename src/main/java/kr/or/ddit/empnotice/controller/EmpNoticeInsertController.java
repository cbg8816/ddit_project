package kr.or.ddit.empnotice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.empnotice.service.EmpNoticeService;
import kr.or.ddit.vo.EmpNoticeVO;

@Controller
@RequestMapping("/empNotice/empNoticeInsert.do")
public class EmpNoticeInsertController {
	
	@Autowired
	private EmpNoticeService service;
	
	@ModelAttribute("empNotice")
	public EmpNoticeVO empNotocie() {
		return new EmpNoticeVO();
	}
	
	@GetMapping
	public String formUI() {
		return "tiles:empNotice/empNoticeInsert";
	}
	
	@PostMapping
	public String formDataProcess(
		@ModelAttribute("empNotice") EmpNoticeVO empNotice
		, Errors errors
		, RedirectAttributes redirectAttributes
	) {
		
		redirectAttributes.addFlashAttribute("empNotice", empNotice);
		
		if(!errors.hasErrors()) {
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			service.createEmpNotice(empNotice);
			return "redirect:/empNotice/empNoticeList.do";
		}else {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "empNotice", errors);
			return "redirect:/empNotice/empNoticeInsert.do";
		}
	}
}
