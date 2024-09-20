package kr.or.ddit.orders.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.orders.dao.OrdersMapper;
import kr.or.ddit.orders.service.OrdersServiceImpl;
import kr.or.ddit.ordersApply.dao.OrdersApplyMapper;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/orders")
public class OrdersDeleteController {
	@Autowired
	private OrdersApplyMapper applyMapper;
	@Autowired
	private OrdersMapper ordersMapper;
	
	@GetMapping("ordersDelete.do")
	public String delete(@RequestParam("what") String orderApplyNo){
		applyMapper.deleteByPrimaryKey(orderApplyNo);
		ordersMapper.deleteByPrimaryKey(orderApplyNo);
		return "redirect:/orders/ordersList.do";
	}
}
