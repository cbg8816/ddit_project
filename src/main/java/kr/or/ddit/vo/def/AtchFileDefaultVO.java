package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class AtchFileDefaultVO implements Serializable {
    private String atchFileId;

    private String atchFileYn;

    private LocalDateTime atchFileReg;

    private String atchFileWri;

    private static final long serialVersionUID = 1L;
}