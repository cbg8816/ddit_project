package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class TodayReportRoomVO {

	//todayReportRoom1

	private int dayRoom;
	private int lastYearDayRoom;
	private String dayRate;
	private int monthRoom;
	private int lastYearMonthRoom;
	private String monthRate;
	private int yearRoom;
	private int lastYearRoom;
	private String yearRate;

}
