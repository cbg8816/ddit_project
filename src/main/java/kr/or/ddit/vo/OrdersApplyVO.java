package kr.or.ddit.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class OrdersApplyVO {
	private String orderApplyNo;
	private String orderApplyTurn;
	private String orderApplyId;
	private String orderApplyLgu;
	private String orderApplyBuyer;
	private LocalDateTime orderApplyDate;
	private LocalDateTime orderApplyInDate;
	private String orderApplyPaymentstate;
	private String orderApplyState;
	private Integer orderApplyQty;
	private OrdersVO orders;
	private ProdVO prod;
	private LprodVO lprod;
	private BuyerVO buyer;
}
