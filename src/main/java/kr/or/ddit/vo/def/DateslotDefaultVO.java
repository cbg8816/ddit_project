package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class DateslotDefaultVO implements Serializable {
    private String dateslotId;

    private String revroomId;

    private String dateslotNm;

    private static final long serialVersionUID = 1L;
}