package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="lprodGu")
public class LprodVO {
	private String lprodId;
	private String lprodGu;
	private String lprodNm;
	
	private List<BuyerVO> buyerList;
}
