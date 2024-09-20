package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class PmsMailDefaultVO implements Serializable {
    private String mailId;

    private String mailTitle;

    private String mailAtchFile;

    private String mailContent;

    private static final long serialVersionUID = 1L;
}