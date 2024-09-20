package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class RevRoomVO implements Serializable {

    private String revroomId;

    private String htrevId;

    private String roomId;

    private String roomtypeId;

    private int revroomPrice;

    // RoomType
    private String roomtypeNm;

    private int roomtypePrice;

    private String roomtypePtype;


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

    @DateTimeFormat(iso = ISO.DATE) // String --> time api로 변환
    private LocalDate trevDate;

    // HotelRev
    private String trevCarno;

    private String htrevCn;

    private String htrevChkin;

    private String htrevChkout;

    private int htrevStay;

    private String htrevPlatform;

    private String htrevPakyn;

    private int htrevTprice;

    private String htrevSlot;

    // Codetype
    private String cdtypeId;

    private String cdtypeKnm;

    private String cdtypeEnm;

    private String cdtypeResDate;

    //RoomStatus
    private String roomSt;

    private String useYn;


    private RoomStatusVO roomStatus;

    private HotelRevVO hotelRev;

    private static final long serialVersionUID = 1L;

}
