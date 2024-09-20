package kr.or.ddit.vo;

import lombok.Data;

@Data
public class TodayReportVO {
	private int dayRoom;
	private int daySum;
	private int lastYearDayRoom;
	private int lastDaySum;
	private int monthSum;
	private int monthRoom;
	private int lastMonthSum;
	private int lastYearMonthRoom;
	private int yearSum;
	private int yearRoom;
	private int lastYearSum;
	private int lastYearRoom;
	private String dayRate;
	private String monthRate;
	private String yearRate;
	private String dayExtRate;
	private String monthExtRate;
	private String yearExtRate;

}
