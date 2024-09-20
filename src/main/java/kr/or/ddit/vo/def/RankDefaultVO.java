package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.math.BigDecimal;
import lombok.Data;

@Data
public class RankDefaultVO implements Serializable {
    private String rankCode;

    private String rankName;

    private BigDecimal rankMlgPer;

    private String rankContent;

    private static final long serialVersionUID = 1L;
}