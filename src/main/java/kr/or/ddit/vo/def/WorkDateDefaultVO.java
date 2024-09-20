package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class WorkDateDefaultVO implements Serializable {
    private Short workNo;

    private String empId;

    private String workDate;

    private LocalDateTime workStart;

    private LocalDateTime workEnd;

    private static final long serialVersionUID = 1L;
}