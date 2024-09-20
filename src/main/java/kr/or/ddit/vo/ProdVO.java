package kr.or.ddit.vo;

import java.io.Serializable;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

	@Data
	@EqualsAndHashCode(of = "prodId")
	@ToString
	public class ProdVO implements Serializable {
		private int rnum;
		
		@NotBlank(groups = UpdateGroup.class)
		private String prodId;
		@NotBlank
	    private String prodName;
		@NotBlank(groups = InsertGroup.class)
	    private String prodLgu;
		@NotBlank(groups = InsertGroup.class)
	    private String prodBuyer;
		@NotNull
		@Min(0)
	    private Integer prodPrice;
		
	    private String prodOutline;
	    
	    private Integer prodTotalstock;
	   
	    private Integer prodProperstock;
	    @ToString.Exclude
	    private String prodDetail;
	    
	    private LprodVO lprod; 
		private BuyerVO buyer;
		private int memCount;
		
	}
