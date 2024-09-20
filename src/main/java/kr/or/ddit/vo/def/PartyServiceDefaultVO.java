package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class PartyServiceDefaultVO implements Serializable {
    private String partyNo;

    private String venueNo;

    private String partyName;

    private LocalDateTime partyStart;

    private LocalDateTime partyEnd;

    private String partyRequest;

    private String partyPlatform;

    private String partyPayopt;

    private String partyRevst;

    private Short partyPercent;

    private static final long serialVersionUID = 1L;
}