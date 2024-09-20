package kr.or.ddit.prod.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.buyer.dao.BuyerMapper;
import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.prod.ProdCondition;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.ProdVO;

@Controller
@RequestMapping("/prod")
public class ProdRetrieveController{
	
	@Autowired
	private ProdService service;
	
	@Autowired
	private BuyerMapper buyerMapper;
	
	@ModelAttribute("buyerList")
	public List<BuyerVO> buyerList(Model model){
		return buyerMapper.selectAll();
	}
	
	@GetMapping("prodList.do")
	public String list(
		@RequestParam(required = false, defaultValue = "1") int page
//		, @ModelAttribute("condition") SimpleCondition simpleCondition
		, @ModelAttribute("prodCondition") ProdCondition prodCondition
		, Model model
	){
		PaginationInfo paging = new PaginationInfo(20,5);
		paging.setPage(page);
//		paging.setSimpleCondition(simpleCondition);
		paging.setProdCondition(prodCondition);
		
		List<ProdVO> prodList = service.retrieveProdList(paging);
		model.addAttribute("prodList", prodList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:prod/prodList";
	}
	
	@GetMapping("prodDetail.do")
	public String detail(@RequestParam("what") String prodId, Model model){
		ProdVO prod = service.retrieveProd(prodId);
		model.addAttribute("prod", prod);
		return "tiles:prod/prodDetail";
	}
	
	@GetMapping("prodOrder.do")
	@ResponseBody
	public List<ProdVO> order(@RequestParam("buyerId") String buyerId, Model model){
		List<ProdVO> prodOrderList = service.findByBuyerIdOrder(buyerId);
		model.addAttribute("prodOrderList",prodOrderList);
		return prodOrderList;
	}
	
	@GetMapping("prodInput.do")
	public String prodInput(){
		return "tiles:orders/ordersProdInsert";
	}
	
}















