package kr.or.ddit.withdrawal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.enter.dao.EnterMapper;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.EnterVO;
import kr.or.ddit.vo.OrdersApplyVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.WithdrawalVO;
import kr.or.ddit.withdrawal.service.WithdrawalService;

@Controller
@RequestMapping("/withdrawal")
public class WithdrawalRetrieveController{
	
	@Autowired
	WithdrawalService service;
	
	@Autowired
	EnterMapper enterMapper;
	
	@GetMapping("withdrawalList.do")
	public String list(
			@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model
	){
		PaginationInfo paging = new PaginationInfo();
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<WithdrawalVO> withdrawalList = service.selectwithdrawalList(paging);
		model.addAttribute("withdrawalList", withdrawalList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:withdrawal/withdrawalList";
	}
	
	@GetMapping("withdrawalSendList.do")
	public String sendList(
			@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model
	){
		PaginationInfo paging = new PaginationInfo();
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<EnterVO> enterList = enterMapper.withdrawalEnterList(paging);
		model.addAttribute("enterList", enterList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:withdrawal/withdrawalSendList";
	}
	
	@GetMapping("withdrawalRemainList.do")
	public String remainList(
			@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model
	){
		PaginationInfo paging = new PaginationInfo();
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<WithdrawalVO> remainList = service.selectRemainList(paging);
		model.addAttribute("remainList", remainList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:withdrawal/withdrawalRemainList";
	}
	
	@GetMapping("withdrawalDetail.do")
	public String detail(@RequestParam("what") String withdrawalNo, Model model){
		List<OrdersApplyVO> ordersApply = service.selectWithdrawal(withdrawalNo);
		model.addAttribute("ordersApply", ordersApply);
		
		return "tiles:withdrawal/withdrawalDetail";
	}
}















