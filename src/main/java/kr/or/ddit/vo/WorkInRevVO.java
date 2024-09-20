package kr.or.ddit.vo;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class WorkInRevVO {

	private String isMemberYN;
	private String trevId;
	private String memId;
	private String memName;
	private String memTel;
	private String trevCarno;
	private Integer trevAdult;
	private Integer trevChild;
	private String trevPayopt;
	private String trevRtype;
	private String htrevChkin;
	private String htrevChkout;
	private Integer htrevStay;
	private Integer htrevTprice;

	private List<RoomDataVO> roomData;
	private List<String> revRoomIds;
	private WorkInPayVO workInPayVO;

}
