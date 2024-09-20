package kr.or.ddit.empnotice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.empnotice.service.EmpNoticeService;
import kr.or.ddit.vo.EmpNoticeVO;

@Controller
@RequestMapping("/empNotice/empNoticeUpdate.do")
public class EmpNoticeUpdateController {
	
	@Autowired
	private EmpNoticeService service;
	
//	@ModelAttribute("empNotice")
//	public EmpNoticeDefaultVO empNotocie() {
//		return new EmpNoticeDefaultVO();
//	}
	
	@GetMapping
	public String formUI(Model model, @RequestParam String what) {
		if(!model.containsAttribute("empNotice")) {
			EmpNoticeVO empNotice = service.retrieveEmpNotice(what);
			model.addAttribute("empNotice", empNotice);
		}
		return "tiles:empNotice/empNoticeUpdate";
	}
	
	@PostMapping
	public String formDataProcess(
		@ModelAttribute("empNotice") EmpNoticeVO empNotice
		, Errors errors
		, RedirectAttributes redirectAttributes
	) {
		
		redirectAttributes.addFlashAttribute("empNotice", empNotice);
		
		if(errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "empNotice", errors);
			return "redirect:/empNotice/empNoticeUpdate.do?what=" + empNotice.getEmpnotiNo();
		}else {
			service.modifyEmpNotice(empNotice);
			return "redirect:/empNotice/empNoticeList.do";
		}
	}
}
