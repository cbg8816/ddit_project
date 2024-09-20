package kr.or.ddit.orders;

import java.time.LocalDate;

import lombok.Data;

@Data
public class OrdersCondition {
	private String orderApplyNo;
	private String orderBuyerName;
	private String orderApplyState;
	private String orderPaymentState;
	private String orderApplyDate;
}
