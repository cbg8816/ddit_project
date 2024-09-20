package kr.or.ddit.buyer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.buyer.service.BuyerService;
import kr.or.ddit.vo.BuyerVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/buyer")
public class BuyerDeleteController {
	
	@Autowired
	private BuyerService service;
	
	@GetMapping("buyerDelete.do")
	public String delete(@RequestParam("what") String buyerId){
		service.deleteBuyer(buyerId);
		return "redirect:/buyer/buyerList.do";
	}
}
