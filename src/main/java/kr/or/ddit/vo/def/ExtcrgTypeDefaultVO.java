package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class ExtcrgTypeDefaultVO implements Serializable {
    private String etId;

    private String etNm;

    private Short etPrice;

    private String etType;

    private static final long serialVersionUID = 1L;
}