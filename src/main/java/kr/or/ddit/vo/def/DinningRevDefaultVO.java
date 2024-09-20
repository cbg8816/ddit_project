package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class DinningRevDefaultVO implements Serializable {
    private String dinId;

    private String dinName;

    private LocalDateTime dinDate;

    private String dinPlatform;

    private String dinPayopt;

    private Short dinTprice;

    private String dinState;

    private String dintypeId;

    private String dinContent;

    private static final long serialVersionUID = 1L;
}