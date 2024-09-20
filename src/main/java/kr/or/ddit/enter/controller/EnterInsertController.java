package kr.or.ddit.enter.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enter.service.EnterService;
import kr.or.ddit.orders.service.OrderService;
import kr.or.ddit.ordersApply.dao.OrdersApplyMapper;
import kr.or.ddit.prod.dao.ProdDao;
import kr.or.ddit.vo.EnterVO;
import kr.or.ddit.vo.OrdersApplyVO;
import kr.or.ddit.vo.OrdersVO;
import kr.or.ddit.vo.ProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/enter/enterInsert.do")
public class EnterInsertController {

	@Autowired
	private EnterService service;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ProdDao prodDao;
	@Autowired
	private OrdersApplyMapper oaMapper;

	@ModelAttribute("orders")
	public OrdersVO orders() {
		return new OrdersVO();
	}
	
	@GetMapping
	public String detail(@RequestParam("what") String orderApplyNo, Model model){
		List<OrdersApplyVO> ordersApply = oaMapper.selectOrdersApplyDetail(orderApplyNo);
		
		model.addAttribute("ordersApply", ordersApply);
		return "tiles:enter/enterInsert";
	}
	
	@PostMapping
	public String formDataProcess( @RequestParam("qtyList[]") List<Integer> qtyList, 
								   @RequestParam("orderApplyNo") List<String> orderApplyNo) {
		System.out.println(qtyList);
		LocalDateTime today = LocalDateTime.now();
		int totalPrice = 0;
		List<OrdersApplyVO> orders = oaMapper.selectOrdersApplyDetail(orderApplyNo.get(0));
		int size = orders.size();
		for (OrdersApplyVO order : orders) {
			totalPrice += order.getOrders().getOrderTotal();
		}

		OrdersApplyVO order = oaMapper.selectOrdersEnter(orderApplyNo.get(0));
		
		EnterVO enter = new EnterVO();

		enter.setEnterTurn(order.getOrderApplyNo());	 //입고번호
		enter.setEnterOrder(order.getOrderApplyNo());	 //방주번호
		enter.setEnterLgu(order.getOrderApplyLgu());//분류명
		enter.setEnterBuyer(order.getOrderApplyBuyer());//거래처명
		enter.setEnterQty(size); //물건종류수
		enter.setEnterTotal(totalPrice);//총액
		enter.setEnterDay(today);//입고일
		
		service.createEnter(enter);

		orderService.modifyorders("입고완료",order.getOrderApplyNo());
		oaMapper.modifyorders("입고완료",order.getOrderApplyNo());
		
		for (int i = 0; i < qtyList.size(); i++) {
	        int qty = qtyList.get(i);
	        OrdersApplyVO orderApply = orders.get(i);
	        prodDao.updateProdQty(qty, orderApply.getOrderApplyId());
	    }

		return "redirect:/enter/enterList.do"; 
	}
}
