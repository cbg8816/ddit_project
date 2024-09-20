package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class EmpNoticeDefaultVO implements Serializable {
    private Short empnotiNo;

    private String emonotiWriter;

    private String empnotiTitle;

    private LocalDateTime empnotiDate;

    private String empnotiFile;

    private String empnotiContent;

    private static final long serialVersionUID = 1L;
}