package kr.or.ddit.vo;

import lombok.Data;

@Data
public class TodayReportRoomAndExtVO {

	//todayReportRoom2

	private int dayExt;
	private int lastYearDayExt;
	private String dayExtRate;

	private int monthExt;
	private int lastYearMonthExt;
	private String monthExtRate;

	private int yearExt;
	private int lastYearExt;
	private String yearExtRate;
}
