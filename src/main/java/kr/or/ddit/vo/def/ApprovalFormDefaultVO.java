package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class ApprovalFormDefaultVO implements Serializable {
    private String formId;

    private String formTitle;

    private String formYn;

    private String formContent;

    private static final long serialVersionUID = 1L;
}