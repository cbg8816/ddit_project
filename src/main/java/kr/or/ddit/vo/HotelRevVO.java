package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.vo.def.CodetypeDefaultVO;
import kr.or.ddit.vo.def.DateslotDefaultVO;
import kr.or.ddit.vo.def.RevRoomDefaultVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;
import kr.or.ddit.vo.def.TotalRevDefaultVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
//@EqualsAndHashCode(of ={"htrevId", "revroomId"})
public class HotelRevVO implements Serializable {
    private String htrevId;

    private String htrevCn;

    private String htrevChkin;

    private String htrevChkout;

    private int htrevStay;

    private String htrevPlatform;

    private String htrevPakyn;

    private int htrevTprice;

    private String htrevSlot;

    private int revroomPrice;

    private String htrevArrive;

    // RevRoom
//    private String revroomId;
//
//    private String roomId;
//
//    private String roomtypeId;

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
//    private String trevDate;

    private String trevCarno;

    // RoomType
    private String roomtypeNm;

    private int roomtypePrice;

    private String roomtypePtype;

    // Room
    private int roomFl;

    private String roomRemark;

    // Codetype
    private String cdtypeId;

    private String cdtypeKnm;

    private String cdtypeEnm;

    private String cdtypeResDate;

    // RoomSt
    private String roomSt;



    private static final long serialVersionUID = 1L;


    private TotalRevDefaultVO totalRev;
    private MemberVO member;
    private RevRoomDefaultVO revRoom;
    private List<RevRoomVO> revRoomList;
    private RoomtypeDefaultVO roomType;
    private CodetypeDefaultVO codeType;
//    private List<DateslotDefaultVO> dateslotList;





}
