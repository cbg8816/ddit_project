package kr.or.ddit.orders.controller;

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

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.orders.OrdersCondition;
import kr.or.ddit.orders.service.OrderService;
import kr.or.ddit.ordersApply.dao.OrdersApplyMapper;
import kr.or.ddit.ordersApply.service.OrderApplyService;
import kr.or.ddit.prod.dao.ProdDao;
import kr.or.ddit.vo.OrdersApplyVO;
import kr.or.ddit.vo.OrdersVO;
import kr.or.ddit.vo.ProdVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/orders")
public class OredersRetrieveController {

	@Autowired
	private OrderApplyService applyService;
	
	@GetMapping("ordersList.do")
	public String list(
		@RequestParam(required = false, defaultValue = "1") int page
//		, @ModelAttribute("condition") SimpleCondition simpleCondition
		, @ModelAttribute("ordersCondition") OrdersCondition ordersCondition
		, Model model
	){
		PaginationInfo paging = new PaginationInfo(15,3);
		paging.setPage(page);
//		paging.setSimpleCondition(simpleCondition);
		paging.setOrderCondition(ordersCondition);
		
		List<OrdersApplyVO> ordersList = applyService.selectOrdersApply(paging);
		model.addAttribute("ordersList", ordersList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:orders/ordersList";
	}
	
	
	
	@GetMapping("ordersDetail.do")
	public String detail(@RequestParam("what") String orderApplyNo, Model model){
		List<OrdersApplyVO> ordersApply = applyService.selectOrdersApplyDetail(orderApplyNo);
		model.addAttribute("ordersApply", ordersApply);
		return "tiles:orders/ordersDetail";
	}
	
	
}
