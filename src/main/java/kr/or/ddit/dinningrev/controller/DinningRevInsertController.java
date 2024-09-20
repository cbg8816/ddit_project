package kr.or.ddit.dinningrev.controller;

import java.util.List;

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

import kr.or.ddit.commons.def.mapper.DintypeDefaultMapper;
import kr.or.ddit.dinningrev.service.DinningRevService;
import kr.or.ddit.vo.DinningRevVO;
import kr.or.ddit.vo.def.DintypeDefaultVO;

@Controller
@RequestMapping("/dinrev/dinRevInsert.do")
public class DinningRevInsertController {

	@Autowired
	private DinningRevService service;

	@Autowired
	private DintypeDefaultMapper dinTypeDAO;

	@ModelAttribute("dinTypeList")
	private List<DintypeDefaultVO> addAttribute(Model model) {
		return dinTypeDAO.selectAll();
	}

	@GetMapping
	public String formUI() {
		return "tiles:dinrev/dinRevInsert";
	}

	@PostMapping
	public String formDataProcess(
		@ModelAttribute("dinRev") DinningRevVO dinRev
		, Errors errors
		, RedirectAttributes redirectAttributes
	) {
		String lvn = "";
		redirectAttributes.addFlashAttribute("dinRev", dinRev);
		if(errors.hasErrors()) {
			// 실패
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn = "redirect:/dinrev/dinRevInsert.do";
		}else {
			// 성공
			service.insertDinRev(dinRev);
			lvn = "redirect:/dinrev/dinRevUpdate.do?what=" + dinRev.getTrevId();
		}

		return lvn;
	}

}
