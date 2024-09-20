package kr.or.ddit.buyer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.buyer.service.BuyerService;
import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.vo.BuyerVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/buyer")
public class BuyerRetrieveController{
	
	@Autowired
	private BuyerService service;
	
	@GetMapping("buyerList.do")
	public String list(
		@RequestParam(required = false, defaultValue = "1") int page
		, @ModelAttribute("condition") SimpleCondition simpleCondition
		, Model model
	){
		PaginationInfo paging = new PaginationInfo(15,3);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<BuyerVO> buyerList = service.retrieveBuyerList(paging);
		model.addAttribute("bList", buyerList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:buyer/buyerList";
	}
	
	@GetMapping("buyerDetail.do")
	public String detail(@RequestParam("what") String buyerId, Model model){
		BuyerVO buyer = service.retrieveBuyer(buyerId);
		model.addAttribute("buyer", buyer);
//		if(model.containsAttribute("redirect")) {
			return "tiles:buyer/buyerDetail";
//		}else {
//			return "buyer/buyerDetail";
//		}
		
	}
}











