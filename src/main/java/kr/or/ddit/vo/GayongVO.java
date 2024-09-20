package kr.or.ddit.vo;

import lombok.Data;

@Data
public class GayongVO {
	private String dateSeq;
//	@DateTimeFormat(iso = ISO.DATE)
//	private LocalDate dateSeq;
	private String roomtypeId;
	private String roomtypeNm;
	private Integer availableRooms;
}
