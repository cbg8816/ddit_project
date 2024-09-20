package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class CodetypeDefaultVO implements Serializable {
    private String cdtypeId;

    private String cdtypeKnm;

    private String cdtypeEnm;

    private String cdtypeResDate;

    private static final long serialVersionUID = 1L;
}