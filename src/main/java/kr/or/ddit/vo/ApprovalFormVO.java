package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ApprovalFormVO {
	private String formId;
	private String formTitle;
	private String formContent;
	private String formYn;

	private AttencanceVO attencance;  // 연차
	private EmpVO emp;
	private ApprovalFormVO formvo;
}
