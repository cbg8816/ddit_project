package kr.or.ddit.vo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

/**
 * 기타요금 VO
 *
 */
@Data
public class ExtrachargesVO {
	private String extcrgNo;
	private String etId;
	private Integer extcrgQty;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate extcrgDate;
	private String etNm;
	private Integer etPrice;
	private String trevSt;
	private String etTotal;
	private Integer payExt;
	private String payId;
	private Integer extcrgPrice;
}
