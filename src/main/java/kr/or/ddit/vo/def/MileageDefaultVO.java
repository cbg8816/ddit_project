package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class MileageDefaultVO implements Serializable {
    private String milId;

    private String memId;

    private String milName;

    private LocalDateTime milRegdate;

    private String milYn;

    private Short milAmount;

    private String milContent;

    private static final long serialVersionUID = 1L;
}