package kr.or.ddit.vo;

import lombok.Data;

@Data
public class TodaySalesVO {

	private String extcrgNo;
	private String etId;
	private int extcrgQty;
	private String extcrgDate;
	private int payId;
	private int extcrgPrice;
	private String etNm;
	private String etType;
	private String payPayopt;

	private String trevId;
	private String memId;
	private String memName;
	private int trevHeadcnt;

	private String htrevChkin;
	private String htrevChkout;

	private String revroomId;
	private String roomId;
	private String roomtypeId;
	private String roomtypeNm;
	private int sumExtCharges;

}
