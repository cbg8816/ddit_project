package kr.or.ddit.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;


@Data
public class RoomVO {

	// Room 부분
	@NotBlank
	private String empName;
	private int hkpNo;
	private String roomId;
	private String roomtypeId;
	private Integer roomFl;
	private String roomRemark;

	private BrokenRoomVO broken;
	private RoomStatusVO roomstatus;
	private EmpVO emp;
	private ManagerVO manager;
	private List<HousekeepingVO> keeping;


}
