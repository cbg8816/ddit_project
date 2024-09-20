package kr.or.ddit.withdrawal.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enter.dao.EnterMapper;
import kr.or.ddit.lprod.dao.LprodMapper;
import kr.or.ddit.ordersApply.dao.OrdersApplyMapper;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.EnterVO;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.WithdrawalVO;
import kr.or.ddit.withdrawal.service.WithdrawalService;

	@Controller
	@RequestMapping("/withdrawal/withdrawalInsert.do")
	public class WithdrawalInsertController{
		
		@Autowired
		WithdrawalService service;
		@Autowired
		EnterMapper enterMapper;
		@Autowired
		OrdersApplyMapper applyMapper;
		
		@PostMapping
		public String formDataProcess(
				 @RequestParam("buyerName") String buyerName,
		            @RequestParam("buyerBank") String buyerBank,
		            @RequestParam("buyerBankno") String buyerBankno,
		            @RequestParam("enterTotal") int enterTotal,
		            @RequestParam("buyerId") String buyerId,
		            @RequestParam("enterTurn") String enterTurn,
		            @RequestParam("enterSend") int enterSend,
		            @RequestParam("enterOrder") String enterOrder,
		            Model model		
			
		){
			
			LocalDateTime date = LocalDateTime.now();
			
			WithdrawalVO withdrawal = new WithdrawalVO();
			String state="";
			
			withdrawal.setWithdrawalNo("WD000001");
			withdrawal.setWithdrawalDate(date);
	        withdrawal.setWithdrawalBuyername(buyerName);
	        withdrawal.setWithdrawalBank(buyerBank);
	        withdrawal.setWithdrawalBankno(buyerBankno);
	        withdrawal.setWithdrawalTotal(enterTotal);
	        withdrawal.setWithdrawalBuyer(buyerId);
	        withdrawal.setWithdrawalEnter(enterTurn);
	        withdrawal.setWithdrawalSend(enterSend);
	        if(enterSend == 0) {
	        	withdrawal.setWithdrawalRemain(enterTotal);
	        	state ="미지급";
	        }
	        else if(enterSend == enterTotal){
	        	withdrawal.setWithdrawalRemain(0);
	        	state = "출금완료";
	        }
	        else {
	        	withdrawal.setWithdrawalRemain(enterTotal-enterSend);
	        	state = "미지급";
	        }
	        
	        service.insert(withdrawal);

	        enterMapper.updateState(state, enterTurn);
	        
	        applyMapper.updatePayment(state, enterOrder);
	        
			return "redirect:/withdrawal/withdrawalList.do";
		}
		
	}

