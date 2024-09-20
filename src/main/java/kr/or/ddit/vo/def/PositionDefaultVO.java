package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class PositionDefaultVO implements Serializable {
    private String posiId;

    private String depId;

    private String posiNm;

    private static final long serialVersionUID = 1L;
}