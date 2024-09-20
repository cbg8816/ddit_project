package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class PaystubListVO {

	@DateTimeFormat(iso = ISO.DATE)
	@NotNull(message = "급여지급일 누락")
	private LocalDate paystubPaydate;
	@DateTimeFormat(iso = ISO.DATE)
	@NotNull(message = "정산시작일 누락")
	private LocalDate paystubStdate;
	@DateTimeFormat(iso = ISO.DATE)
	@NotNull(message = "정산종료일 누락")
	private LocalDate paystubEnddate;

	private List<PaystubVO> paystubList;

}
