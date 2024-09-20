package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class DepartmentDefaultVO implements Serializable {
    private String depId;

    private String depNm;

    private static final long serialVersionUID = 1L;
}