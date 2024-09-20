package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 마일리지 VO
 *
 */
@Data
@EqualsAndHashCode(of = "milId")
public class MileageVO implements Serializable {

	private String milId;

	private String memId;

	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate milRegdate;

	private Integer milEarn;

	private Integer milUse;

	private String roomtypeNm;

	private String payId;

	private String trevId;
}
