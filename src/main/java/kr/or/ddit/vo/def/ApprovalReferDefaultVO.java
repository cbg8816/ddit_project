package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class ApprovalReferDefaultVO implements Serializable {
    private String aprRefId;

    private String aprId;

    private String aprRemp;

    private LocalDateTime arDay;

    private static final long serialVersionUID = 1L;
}