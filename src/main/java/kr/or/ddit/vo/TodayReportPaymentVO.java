package kr.or.ddit.vo;

import lombok.Data;

@Data
public class TodayReportPaymentVO {

	//todayReportPayment

	private int totalPay;//매출액
	private int discount;//매출조정
	private int receivables;//업장후불

	private int realPayment;//실매출액
	private int paymentResult;//매출 계

	public int getRealPayment() {
		return totalPay - discount;
	}

	public int getPaymentResult() {
		return realPayment - receivables;
	}

	private int payCash;//현금
	private int payCard;//카드
	private int payEasyPayment;//간편결제
	private int payInternet;//인터넷 선결제
	private int payLater;//후불계

}
