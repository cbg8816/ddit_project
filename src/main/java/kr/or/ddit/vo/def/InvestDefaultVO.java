package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class InvestDefaultVO implements Serializable {
    private String investId;

    private String linvestId;

    private String investNm;

    private LocalDateTime investSdate;

    private LocalDateTime investLdate;

    private Short investPayment;

    private String investDept;

    private String investCharger;

    private String investYn;

    private String aprId;

    private static final long serialVersionUID = 1L;
}