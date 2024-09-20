package kr.or.ddit.prod.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.buyer.service.BuyerService;
import kr.or.ddit.prod.service.ProdService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/prod")
public class ProdDeleteController {

	@Autowired
	private ProdService service;
	
	@GetMapping("prodDelete.do")
	public String delete(@RequestParam("what") String prodId){
		service.deleteProd(prodId);
		return "redirect:/prod/prodList.do";
	}
}
