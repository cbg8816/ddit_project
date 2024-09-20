package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class PmsApprovalDefaultVO implements Serializable {
    private String aprId;

    private String formId;

    private String aprTitle;

    private LocalDateTime aprRegdate;

    private String aprWriter;

    private String aprFileId;

    private String aprState;

    private String aprDyn;

    private String aprSyn;

    private String aprContent;

    private static final long serialVersionUID = 1L;
}