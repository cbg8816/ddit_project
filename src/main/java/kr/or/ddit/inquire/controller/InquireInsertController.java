package kr.or.ddit.inquire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.inquire.service.InquireService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.InquireVO;

@RequestMapping("/web/inquire")
@Controller
public class InquireInsertController {
	@Autowired
	private InquireService inquireService;

	public static final String MODELNAME = "inquire";

	@ModelAttribute(MODELNAME)
	public InquireVO inquire() {
		return new InquireVO();
	}

	@GetMapping("insert.do")
	public String insertUI() {
		return "wiles:inquire/insert";
	}

	@PostMapping("insert.do")
	public String insertForm(
			@Validated(InsertGroup.class) @ModelAttribute(MODELNAME) InquireVO inquire
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		String lvn = null;
		if(!errors.hasErrors()) {
			inquireService.insertInquire(inquire);
			redirectAttributes.addFlashAttribute("message", "이용문의 등록 완료!");
			lvn = "redirect:/web/inquire/list.do";
		}else {
			redirectAttributes.addFlashAttribute(MODELNAME, inquire);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + MODELNAME, errors);
			lvn = "redirect:/web/inquire/insert.do";
		}

		return lvn;
	}

	@GetMapping("update.do")
	public String updateUI(@RequestParam("what") String inqNo, Model model) {
		InquireVO inquire = inquireService.selectInquire(inqNo);
		model.addAttribute(MODELNAME, inquire);

		return "wiles:inquire/update";
	}

	@PostMapping("update.do")
	public String updateForm(
			@Validated(UpdateGroup.class) @ModelAttribute(MODELNAME) InquireVO inquire
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		String lvn = null;
		if(!errors.hasErrors()) {
			inquireService.updateInquire(inquire);
			redirectAttributes.addFlashAttribute("message", "이용문의 수정 완료!");
			lvn = "redirect:/web/inquire/detail.do?what=" + inquire.getInqNo();
		}else {
			redirectAttributes.addFlashAttribute(MODELNAME, inquire);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + MODELNAME, errors);
			lvn = "redirect:/web/inquire/update.do?what=" + inquire.getInqNo();
		}

		return lvn;
	}
}
