package kr.or.ddit.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class WorkDateVO {

	private Integer workNo;
	private String empId;
	private LocalDate workDate;
	private LocalDateTime workStart;
	private LocalDateTime workEnd;
	private String workStatus;
}
