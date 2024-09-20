package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class ProdDefaultVO implements Serializable {
    private String prodId;

    private String prodName;

    private String prodLgu;

    private String prodBuyer;

    private Long prodPrice;

    private String prodOutline;

    private Long prodTotalstock;

    private Long prodProperstock;

    private String prodDetail;

    private static final long serialVersionUID = 1L;
}