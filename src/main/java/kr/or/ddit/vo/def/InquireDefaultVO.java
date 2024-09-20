package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class InquireDefaultVO implements Serializable {
    private String inqNo;

    private String memId;

    private String inqTitle;

    private String inqWriter;

    private LocalDateTime inqRegdate;

    private String inqCategory;

    private String inqFile;

    private String inqContent;

    private static final long serialVersionUID = 1L;
}