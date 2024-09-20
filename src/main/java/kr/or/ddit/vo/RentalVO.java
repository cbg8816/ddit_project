package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.ddit.vo.def.RentalprodVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="hkrNo")
public class RentalVO implements Serializable{

	private Integer hkrNo;
	private String hkrNos;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate hkrDate;

	private String hkrRoom;

	private String hkrCostomer;

	private String hkrCheckin;

	private String hkrCheckout;

	private String hkrKind;

	private Integer hkrQty;

	private String hkrHp;

	private String hkrReturn;

	private RentalprodVO renprod;
}
