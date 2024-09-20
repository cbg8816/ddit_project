package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class EventDefaultVO implements Serializable {
    private String eventId;

    private String eventName;

    private LocalDateTime eventPeriod;

    private String eventContent;

    private static final long serialVersionUID = 1L;
}