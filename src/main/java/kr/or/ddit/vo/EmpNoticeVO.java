package kr.or.ddit.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class EmpNoticeVO {
	private Integer empnotiNo;
	private String emonotiWriter;
	private String empnotiTitle;
	private String empnotiContent;
	private LocalDate empnotiDate;
	private String empnotiFile;
}
