package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class AtchDetailDefaultVO implements Serializable {
    private String atchDetailId;

    private String atchFileId;

    private String logicalName;

    private String pysicalName;

    private String atchCours;

    private String fileExtension;

    private String fileSize;

    private LocalDateTime fileRegdate;

    private String fileDelyn;

    private static final long serialVersionUID = 1L;
}