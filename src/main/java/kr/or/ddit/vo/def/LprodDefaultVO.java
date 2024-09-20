package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class LprodDefaultVO implements Serializable {
    private String lprodGu;

    private String lprdoId;

    private String lprodNm;

    private static final long serialVersionUID = 1L;
}