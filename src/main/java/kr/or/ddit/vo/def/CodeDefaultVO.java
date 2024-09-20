package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class CodeDefaultVO implements Serializable {
    private String code;

    private String cdtypeId;

    private String codeNm;

    private String codeType;

    private String useyn;

    private LocalDateTime codeTimeDate;

    private static final long serialVersionUID = 1L;
}