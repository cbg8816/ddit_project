package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class EventJoinDefaultVO implements Serializable {
    private String eventjIdx;

    private String eventId;

    private LocalDateTime eventjJoinDate;

    private String eventjCheck;

    private String eventjId;

    private static final long serialVersionUID = 1L;
}