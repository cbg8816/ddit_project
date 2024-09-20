package kr.or.ddit.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class WithdrawalVO {
	private String withdrawalNo;
	private String withdrawalEnter;
	private String withdrawalBuyer;
	private LocalDateTime withdrawalDate;
	private String withdrawalBuyername;
	private String withdrawalBank;
	private String withdrawalBankno;
	private Integer withdrawalTotal;
	private Integer withdrawalSend;
	private Integer withdrawalRemain;
	
	
	private OrdersVO orders;
	private ProdVO prod;
	private BuyerVO buyer;
	private EnterVO enter;
}
