package kr.or.ddit.prod.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import kr.or.ddit.lprod.dao.LprodMapper;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;


@Controller
@RequestMapping("/prod/prodUpdate.do")
public class ProdUpdateController{
	@Autowired
	private ProdService service;
	@Autowired
	private LprodMapper lprodDAO;
	
	@ModelAttribute("lprodList")
	public List<LprodVO> addAttribute(HttpServletRequest req) {
		return lprodDAO.selectLprodList();
	}
	
	@GetMapping
	public String formUI(@RequestParam String what, Model model){
		ProdVO prod = service.retrieveProd(what);
		model.addAttribute("prod", prod);
		return "tiles:prod/prodUpdate";
	}
	
	@PostMapping
	public String formDataProcess(
		@Validated(UpdateGroup.class) @ModelAttribute("prod") ProdVO prod
		, Errors errors
	){
		String lvn = null;
		if(!errors.hasErrors()) {
			service.modifyProd(prod);
			lvn = "redirect:/prod/prodDetail.do?what="+prod.getProdId();
		}else {
			lvn = "tiles:prod/prodUpdate";
		}
		return lvn;
	}
}




	
