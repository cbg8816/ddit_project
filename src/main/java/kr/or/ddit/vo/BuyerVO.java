package kr.or.ddit.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

	@Data
	@EqualsAndHashCode(of = "buyerId")
	public class BuyerVO {
		@NotBlank(groups = UpdateGroup.class)
		private String buyerId;
		@NotBlank
		private String buyerName;
		@NotBlank(groups = InsertGroup.class)
		private String buyerLgu;
		private String buyerBank;
		private String buyerBankno;
		private String buyerBankname;
		private String buyerZip;
		private String buyerAdd1;
		private String buyerAdd2;
		@NotBlank
		private String buyerComtel;
		@NotBlank
		private String buyerFax;
		@NotBlank
		private String buyerMail;
		private String buyerCharger;
		
		private LprodVO lprod;
		private List<ProdVO> prodList; 
		private int prodCount;
}
