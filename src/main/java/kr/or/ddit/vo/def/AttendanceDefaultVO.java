package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class AttendanceDefaultVO implements Serializable {
    private String key;

    private String empId;

    private Short atteTardy;

    private Short atteAllAnLeave;

    private Short atteLeftAnLeave;

    private Short atteUseAnLeave;

    private String attendanceStatus;

    private static final long serialVersionUID = 1L;
}