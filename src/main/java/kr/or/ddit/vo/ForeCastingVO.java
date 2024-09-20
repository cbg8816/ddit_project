package kr.or.ddit.vo;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class ForeCastingVO {
	// AVAILABLE_ROOMS
	private Integer availableRooms;
	private String dateSeq;
//	private Date dateSeq;
	private Integer totalRoom;

//	@DateTimeFormat(iso = ISO.DATE)
//	private LocalDate dateSeq;
	// DATE_SEQ
//	@DateTimeFormat(iso = ISO.DATE)
//	private LocalDate dateSeq;
//	private List<ForeCastingVO> dateSeqList;
//	private List<DateVO> dateSeqList;

	// RoomVO
//	private String roomId;
//	private String roomtypeId;
//	private Integer roomFl;
//	private String roomRemark;

//	private RoomtypeVO roomtypeVO;


	// DateSlotVO
//	private String dateslotId;
//
//    private String revroomId;
//
//    private String dateslotDate;
//
//    private String dateslotNm;
}
