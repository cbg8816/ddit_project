package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class WorkShiftDefaultVO implements Serializable {
    private String workId;

    private String empId;

    private String workType;

    private String workOffyn;

    private String workRemark;

    private String workDay;

    private String workOrderid;

    private static final long serialVersionUID = 1L;
}