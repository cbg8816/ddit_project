package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class ApprovalFavDefaultVO implements Serializable {
    private String formId;

    private String empId;

    private static final long serialVersionUID = 1L;
}