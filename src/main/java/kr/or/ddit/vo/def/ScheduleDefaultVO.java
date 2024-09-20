package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class ScheduleDefaultVO implements Serializable {
    private String empId;

    private String schedTitle;

    private String schedCn;

    private String schedGu;

    private static final long serialVersionUID = 1L;
}