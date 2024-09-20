package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class MiluseDefaultVO implements Serializable {
    private String miluseId;

    private String memId;

    private LocalDateTime miluseDate;

    private String miluseCn;

    private Short miluseAmount;

    private static final long serialVersionUID = 1L;
}