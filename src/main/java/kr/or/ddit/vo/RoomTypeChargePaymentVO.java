package kr.or.ddit.vo;

import lombok.Data;

@Data
public class RoomTypeChargePaymentVO {

	private String yearTdate;
	private String monthTdate;
	private String roomtypeId;
	private int priceSum;
	private int cnt;

}
