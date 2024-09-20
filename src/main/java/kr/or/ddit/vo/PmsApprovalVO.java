package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class PmsApprovalVO {
	private String halfDay;
	private String aprId;
	private String annDep;
	private String formId;
	private String aprTitle;
	private String aprContent;
	private LocalDate aprRegdate;
	private String aprWriter;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate startDate;
	private String aprState;
	private String aprKind;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate endDate;

	private ApprovalFormVO formvo;
	private EmpVO empvo;
	private List<ApprovalLineVO> lineList;
}
