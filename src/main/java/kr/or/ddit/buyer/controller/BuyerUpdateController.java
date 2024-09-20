package kr.or.ddit.buyer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.buyer.service.BuyerService;
import kr.or.ddit.lprod.dao.LprodMapper;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/buyer/buyerUpdate.do")
@RequiredArgsConstructor
public class BuyerUpdateController {
	@Autowired
	private BuyerService service;
	
	@Autowired
	private LprodMapper lprodDAO;
	
	@ModelAttribute("lprodList")
	public List<LprodVO> addAttribute(Model model) {
		return lprodDAO.selectLprodList();
	}
	
	@GetMapping
	public String formUI(@RequestParam String what, Model model) {
		if(!model.containsAttribute("buyer")) {
			BuyerVO buyer = service.retrieveBuyer(what);
			model.addAttribute("buyer", buyer);
		}
		return "tiles:buyer/buyerUpdate";
	}
	
	@PostMapping
	public String formDataProcess(
		@Validated(UpdateGroup.class) BuyerVO buyer
		, Errors errors
		, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("buyer", buyer);
		if(errors.hasErrors()) {
			return "redirect:/buyer/buyerUpdate.do?what="+buyer.getBuyerId();
		}else {
			service.modifyBuyer(buyer);
			return "redirect:/buyer/buyerDetail.do?what="+buyer.getBuyerId();	
		}
	}
}














