package kr.or.ddit.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "enterTurn")
@ToString
public class EnterVO {
		
	private String enterTurn;
	private String enterOrder;
	private String enterLgu;
	private String enterBuyer;
	private String enterWith;
	private Integer enterQty;
	private Integer enterTotal;
	private LocalDateTime enterDay;
    
	private LprodVO lprod;
	private BuyerVO buyer;
}
