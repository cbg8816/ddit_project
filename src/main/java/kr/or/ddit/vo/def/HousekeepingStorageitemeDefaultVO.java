package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class HousekeepingStorageitemeDefaultVO implements Serializable {
    private String hksNo;

    private String hksWriter;

    private LocalDateTime hksDate;

    private LocalDateTime hksPlace;

    private String hksAcquirer;

    private String hksKind;

    private String hksRegi;

    private String hksNote;

    private static final long serialVersionUID = 1L;
}