package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class EmpDefaultVO implements Serializable {
    private String empId;

    private String posiId;

    private String empPw;

    private LocalDateTime empHirdate;

    private String empName;

    private LocalDateTime empBir;

    private String empTel;

    private String empGen;

    private Short empSal;

    private String empSta;

    private LocalDateTime empRes;

    private String empFile;

    private static final long serialVersionUID = 1L;
}