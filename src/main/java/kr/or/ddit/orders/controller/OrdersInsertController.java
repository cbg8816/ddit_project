package kr.or.ddit.orders.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.buyer.dao.BuyerMapper;
import kr.or.ddit.lprod.dao.LprodMapper;
import kr.or.ddit.orders.dao.OrdersMapper;
import kr.or.ddit.orders.service.OrderService;
import kr.or.ddit.ordersApply.dao.OrdersApplyMapper;
import kr.or.ddit.prod.dao.ProdDao;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.OrdersApplyVO;
import kr.or.ddit.vo.OrdersVO;
import kr.or.ddit.vo.ProdVO;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/orders/ordersInsert.do")
public class OrdersInsertController {

	@Autowired
	private OrderService service;
	@Autowired
	private LprodMapper lprodDAO;
	@Autowired
	private ProdDao prodDAO;
	@Autowired
	private BuyerMapper buyerDAO;
	@Autowired
	private OrdersApplyMapper ordersApplymapper;


	@ModelAttribute("lprodList")
	public List<LprodVO> addAttribute(HttpServletRequest req) {
		return lprodDAO.selectLprodList();
	}

	@ModelAttribute("prodList")
	public List<ProdVO> addAttribute2(HttpServletRequest req) {
		return prodDAO.selectProdListNoPaging();
	}

	@ModelAttribute("orders")
	public OrdersVO orders() {
		return new OrdersVO();
	}
	
	@GetMapping("/getBuyersByLprodGu")
	@ResponseBody
	public List<BuyerVO> getBuyersByLprodGu(@RequestParam("lprodGu") String lprodGu, Model model) {
		List<BuyerVO> buyerList = buyerDAO.findByLprodGu(lprodGu);
		 return buyerList;
	}

	@GetMapping("/getProductsByBuyerId")
	@ResponseBody
	public List<ProdVO> getProductsByBuyerId(@RequestParam("buyerId") String buyerId, Model model) {
		List<ProdVO> prodList = prodDAO.findByBuyerId(buyerId);
		return prodList;
	}
	
	@GetMapping("/getProductsByProdId")
	@ResponseBody
	public ProdVO getProductsByProdId(@RequestParam("prodId") String prodId, Model model) {
		ProdVO prod = prodDAO.selectProd(prodId);
		return prod;
	}
	
	@GetMapping
	public String formUI() {
		return "tiles:orders/ordersInsert";
	}
	
	
	@PostMapping
	@ResponseBody
	public Map<String, String> formDataProcess(@Validated(InsertGroup.class) @RequestBody List<Map<String, String>> formData, Errors errors) {
		
		LocalDateTime day = LocalDateTime.now();
		 LocalDateTime sevenDaysLater = day.plusDays(7);
		  Random random = new Random();
	        int randomNumber = random.nextInt(900000) + 100000;
	        String randomString = "ON" + randomNumber;
	        
		for (int i = 0; i < formData.size(); i++) {
	        String orderId = formData.get(i).get("orderId");
	        String orderQty = formData.get(i).get("orderProdQty");
	        String orderTotal = formData.get(i).get("orderTotal");
	        OrdersVO order = new OrdersVO();
	        
	        ProdVO prod = prodDAO.selectProd(orderId);
	        
	        order.setOrderDate(day);
	        order.setOrderState("미승인");
	        order.setOrderPaymentstate("미지급");
	        order.setOrderQty(Integer.parseInt(orderQty));
	        order.setOrderPrice(prod.getProdPrice());
	        order.setOrderLgu(prod.getProdLgu());
	        order.setOrderId(orderId);
	        order.setOrderTurn("O001");
	        order.setOrderBuyer(prod.getProdBuyer());
	        order.setOrderTotal(Integer.parseInt(orderTotal));
	        
	        service.createOrders(order);
	        
	        OrdersApplyVO oaVO = new OrdersApplyVO();
	        oaVO.setOrderApplyNo(randomString);
	        oaVO.setOrderApplyTurn(order.getOrderTurn());
	        oaVO.setOrderApplyLgu(order.getOrderLgu());
	        oaVO.setOrderApplyId(order.getOrderId());
	        oaVO.setOrderApplyBuyer(order.getOrderBuyer());
	        oaVO.setOrderApplyDate(order.getOrderDate());
	        oaVO.setOrderApplyInDate(sevenDaysLater);
	        oaVO.setOrderApplyPaymentstate(order.getOrderPaymentstate());
	        oaVO.setOrderApplyState(order.getOrderState());
	        oaVO.setOrderApplyQty(order.getOrderQty());
	        
	        ordersApplymapper.insert(oaVO);
	    }
		Map<String, String> response = new HashMap<>();
	    response.put("orderApplyNo", randomString);
	    
	    return response;
	}
}
