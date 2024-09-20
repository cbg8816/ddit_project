package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class LinvestDefaultVO implements Serializable {
    private String linvestId;

    private String linvestNm;

    private static final long serialVersionUID = 1L;
}