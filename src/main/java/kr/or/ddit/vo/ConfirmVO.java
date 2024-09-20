package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ConfirmVO {

	private String orderApplyNo;
	private String orderApplyTurn;
	private String orderApplyId;
	private String orderApplyLgu;
	private String orderApplyBuyer;
	private String orderApplyDate;
	private String orderApplyPaymentState;
	private String orderApplyState;
	private int orderApplyQty;
	private int orderPrice;
	private int orderTotalPrice;

	private String prodName;
	private String prodOutline;

	private String buyerId;
	private String buyerName;
	private String buyerBank;
	private String buyerBankNo;
	private String buyerCharger;
	private String buyerAdd1;
	private String buyerAdd2;
	private String buyerComTel;
	private String buyerMail;

	private String lprodId;
	private String lprodNm;

}
