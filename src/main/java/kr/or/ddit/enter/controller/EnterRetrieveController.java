package kr.or.ddit.enter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.enter.EnterCondition;
import kr.or.ddit.enter.service.EnterService;
import kr.or.ddit.ordersApply.dao.OrdersApplyMapper;
import kr.or.ddit.vo.EnterVO;
import kr.or.ddit.vo.OrdersApplyVO;

@Controller
@RequestMapping("/enter")
public class EnterRetrieveController {
	@Autowired
	private EnterService service;
	
	@Autowired
	private OrdersApplyMapper oaMapper;
	
	@GetMapping("enterList.do")
	public String list(
		@RequestParam(required = false, defaultValue = "1") int page
//		, @ModelAttribute("condition") SimpleCondition simpleCondition
		, @ModelAttribute("enterCondition") EnterCondition enterCondition
		, Model model
	){
		PaginationInfo paging = new PaginationInfo(5,3);
		paging.setPage(page);
		paging.setEnterCondition(enterCondition);
		
		List<EnterVO> enterList = service.retrieveEnterList(paging);
		model.addAttribute("enterList", enterList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:enter/enterList";
	}
	
	@GetMapping("enterDetail.do")
	public String detail(@RequestParam("what") String ordersTurn, Model model){
		List<OrdersApplyVO> orderApplyList =  oaMapper.selectOrdersApplyDetail(ordersTurn);
		model.addAttribute("applyList", orderApplyList);
		return "tiles:enter/enterDetail";
	}
}
