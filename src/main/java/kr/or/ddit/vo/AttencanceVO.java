package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

@Data
public class AttencanceVO implements Serializable {
	private String atteId;
	private String empId;
	private Integer atteAllAnLeave;
	private Integer atteLeftAnLeave;
	private Integer atteUseAnLeave;

	private EmpVO emp;
	private AttencanceDetailVO attDetail;
	private ApprovalFormVO approvalForm;

	private List<AttencanceDetailVO> attDetailList;
}
