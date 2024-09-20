package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class NoticeDefaultVO implements Serializable {
    private String notiNo;

    private String notiWriter;

    private String notiTitle;

    private LocalDateTime notiRegdate;

    private String notiCategory;

    private String empId;

    private String notiFile;

    private String notiContent;

    private static final long serialVersionUID = 1L;
}