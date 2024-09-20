package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class UseOfProdDefaultVO implements Serializable {
    private String prodId;

    private String lprdoId;

    private String hkpNo;

    private LocalDateTime uopDay;

    private String uopName;

    private Short uopQty;

    private String uopManager;

    private String uopEqClass;

    private static final long serialVersionUID = 1L;
}