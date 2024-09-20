package kr.or.ddit.housekeeping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.housekeeping.service.HousekeepingService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.HousekeepingVO;





@Controller
@RequestMapping("/housekeeping/insert.do")
public class HousekeepinginsertController {

	@Autowired
	private HousekeepingService service;
//
//	@ModelAttribute("lprodList")
//	public List<LprodVO> addAttribute(HttpServletRequest req) {
//		return lprodDAO.selectLprodList();
//	}
//
//	@ModelAttribute("prod")
//	public ProdVO prod() {
//		return new ProdVO();
//	}

	@GetMapping
	public String formUI(){
		return "tiles:housekeeping/keepinginsert";
	}

	@PostMapping
	public String formDataProcess(
		@Validated(InsertGroup.class) @ModelAttribute("keeping") HousekeepingVO keeping
		, Errors errors
	){
		String lvn = null;
		if(!errors.hasErrors()) {
			service.createKeeping(keeping);
			lvn = "redirect:/housekeeping/prodDetail.do?what="+keeping.getHkpNo();
		}else {
			lvn = "tiles:housekeeping/keepinginsert";
		}
		return lvn;
	}
}
