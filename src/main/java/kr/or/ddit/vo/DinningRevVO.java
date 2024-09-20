package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.vo.def.DintypeDefaultVO;
import lombok.Data;

@Data
public class DinningRevVO implements Serializable {
    private String dinId;

    private String dinName;

//    @DateTimeFormat(iso = ISO.DATE) // String --> time api로 변환
    private String dinDate;

    private String dinPlatform;

    private String dinPayopt;

    private int dinTprice;

    private String dinState;

    private String dintypeId;

    private String dinContent;

    // DinType
    private String dintypeNm;

    private int dintypeAdprice;

    private int dintypeChprice;

    // Member
    private String memId;

    private String rankCode;

    private String memName;

    private String memCategory;

    private String memLoginId;

    private String memLoginPw;

    private String memEmail;

    private String memTel;

    private String memYn;

    // TotalRev
    private String trevId;

    private int trevAdult;

    private int trevChild;

    private String trevPayopt;

    private String trevRtype;

    private String trevSt;

    private String trevCarno;

    @DateTimeFormat(iso = ISO.DATE) // String --> time api로 변환
    private LocalDate trevDate;

    private static final long serialVersionUID = 1L;



}
