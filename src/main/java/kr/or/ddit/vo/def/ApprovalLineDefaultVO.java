package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class ApprovalLineDefaultVO implements Serializable {
    private String aprlineId;

    private String aprId;

    private String empId;

    private Short aprlineTurn;

    private LocalDateTime aprlineStDay;

    private String aprlineState;

    private String aprlineCont;

    private LocalDateTime aprlineReg;

    private static final long serialVersionUID = 1L;
}