package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="roomtypeNm")
public class RoomtypeVO {
	private String roomtypeId;
	private String roomtypeNm;
	private Integer roomtypePrice;
	private String roomtypePtype;

	private List<BrokenRoomVO> brokenList;

	private List<ForeCastingVO> forecastingList;
}
