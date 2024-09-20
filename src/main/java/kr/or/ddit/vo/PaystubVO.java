package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class PaystubVO {
	private String paystubId;
	@NotBlank(message = "사원이름 누락")
	private String empId;
	private String speId;
	@DateTimeFormat(iso = ISO.DATE)
	@NotNull(message = "급여지급일 누락")
	private LocalDate paystubPaydate;
	@DateTimeFormat(iso = ISO.DATE)
	@NotNull(message = "정산시작일 누락")
	private LocalDate paystubStdate;
	@DateTimeFormat(iso = ISO.DATE)
	@NotNull(message = "정산종료일 누락")
	private LocalDate paystubEnddate;
	@NumberFormat(style = Style.NUMBER)
	@NotNull(message = "기본급 누락")
	private Integer paystubNomal;
	@NumberFormat(style = Style.NUMBER)
	@NotNull(message = "상여금 누락")
	private Integer paystubBonus;
	@NumberFormat(style = Style.NUMBER)
	@NotNull(message = "야근수당 누락")
	private Integer paystubOvertime;
	@NumberFormat(style = Style.NUMBER)
	@NotNull(message = "총금액 누락")
	private Integer paystubTotal;
	@NumberFormat(style = Style.NUMBER)
	@NotNull(message = "공제금액 누락")
	private Integer deductible;
	@NumberFormat(style = Style.NUMBER)
	@NotNull(message = "국민연금 누락")
	private Integer paystubNaPen;
	@NumberFormat(style = Style.NUMBER)
	@NotNull(message = "건강보험 누락")
	private Integer paystubHeIns;
	@NumberFormat(style = Style.NUMBER)
	@NotNull(message = "고용보험 누락")
	private Integer paystubEmpIns;
	@NumberFormat(style = Style.NUMBER)
	@NotNull(message = "장기요양보험료 누락")
	private Integer paystubLongIns;
	@NumberFormat(style = Style.NUMBER)
	@NotNull(message = "소득세 누락")
	private Integer paystubIncomeTax;
	@NumberFormat(style = Style.NUMBER)
	@NotNull(message = "지방소득세 누락")
	private Integer paystubLoIncomeTax;
	@NumberFormat(style = Style.NUMBER)
	@NotNull(message = "실수령액 누락")
	private Integer paystubRealtotal;


	private EmpVO emp;

	private SpecificationVO spe;

	private List<SpecificationVO> speList;


}
