package kr.or.ddit.vo;

import lombok.Data;

@Data
public class WorkInPayVO {

	private int payId;
	private String payPayopt;
	private String payTprice;
	private String payDate;
	private String trevId;
	private String payCm;

	private int milId;
	private String memId;
	private String milEarn;
	private String milUse;

}
