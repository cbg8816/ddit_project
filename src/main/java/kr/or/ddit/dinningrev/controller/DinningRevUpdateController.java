package kr.or.ddit.dinningrev.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
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
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/dinrev/dinRevUpdate.do")
public class DinningRevUpdateController {

	@Autowired
	private DinningRevService service;

	@Autowired
	private DintypeDefaultMapper dinTypeDAO;

	@ModelAttribute("dinTypeList")
	private List<DintypeDefaultVO> addAttribute(Model model) {
		return dinTypeDAO.selectAll();
	}

	@GetMapping
	public String formUI(
			Model model
			, @RequestParam String what
//			, DinningRevVO dinRevVO
	) {
		DinningRevVO dinRev = service.selectDinRev(what);

//		dinRevVO.setDinId(dinId);
//		dinRevVO = service.selectDinRev(dinRev);
		model.addAttribute("dinRev", dinRev);

		return "tiles:dinrev/dinRevUpdate";
	}

	@PostMapping
	public String formDataProcess(
			@ModelAttribute("dinRev") DinningRevVO dinRev
			, Errors errors
			, RedirectAttributes redirectAttributes
	) {
		log.info("formDataProcess : {}", dinRev);
		log.info("formDataProcess errors : {}", errors.hasErrors());
		log.info("formDataProcess errors : {}", errors.getFieldErrorCount());
		log.info("formDataProcess errors : {}", errors.getAllErrors());

		List<ObjectError> errorList = errors.getAllErrors();
		for (ObjectError objectError : errorList) {
			log.info("formDataProcess errors : {}", objectError.getCode() );
			log.info("formDataProcess errors : {}", objectError.getObjectName());
			log.info("formDataProcess errors : {}", objectError.getDefaultMessage());
		}

		String lvn = "";

		if (errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn = "redirect:/dinrev/dinRevUpdate.do?what=" + dinRev.getDinId();
		} else {
			service.updateDinRev(dinRev);
			lvn = "redirect:/dinrev/dinRevList.do";
		}

		return lvn;
	}

}










