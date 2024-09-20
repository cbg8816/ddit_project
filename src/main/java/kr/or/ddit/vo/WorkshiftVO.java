package kr.or.ddit.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"empId", "workDay"})
public class WorkshiftVO {

    private String workId;

    private String empId;

    private String workType;

    private String workOffyn;

    private String workRemark;

    private String workDay;

    private String workOrderid;

    private String inputDate;

    private EmpVO emp;

    private static final long serialVersionUID = 1L;
}
