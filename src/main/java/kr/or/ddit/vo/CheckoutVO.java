package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

/**
 * 퇴실/정산 VO
 * 입실일, 퇴실일, 숙박일, 룸타입, 객실, 객실요금, 예약번호, 고객명, 차량번호
 */
@Data
public class CheckoutVO implements Serializable {
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate htrevChkin;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate htrevChkout;
	private int htrevStay;
	private String roomtypeNm;
	private String roomId;
	private int htrevTprice;
	private String trevId;
	private String memName;
	private String trevCarno;
	private int rnum;
	private String payId;
	private String extcrgNo;
	private String trevSt;
	private int payExt;
}
