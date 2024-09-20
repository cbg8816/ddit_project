package kr.or.ddit.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ApprovalLineVO {
	private String aprlineId;
	private String aprId;
	private String empId;
	private String empName;
	private Integer aprlineTurn;
	private LocalDate aprlineStDay;
	private String aprlineState;
	private String aprlineCont;
	private LocalDate aprlineReg;
	private String aprlineDep;
}
