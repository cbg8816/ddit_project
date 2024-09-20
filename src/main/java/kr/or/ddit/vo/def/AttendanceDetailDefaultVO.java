package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class AttendanceDetailDefaultVO implements Serializable {
    private String key;

    private String empId;

    private LocalDateTime adDay;

    private String adContent;

    private String adCatagory;

    private LocalDateTime adWorkWt;

    private String adStrDate;

    private String adEndDay;

    private static final long serialVersionUID = 1L;
}