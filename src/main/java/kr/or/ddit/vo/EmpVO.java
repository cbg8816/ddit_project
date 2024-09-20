package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;

@Data
public class EmpVO implements Serializable {
	@NotBlank(message = "사번 누락")
	private String empId;
	@NotBlank(message = "직책 누락")
	private String posiId;
	private String empPw;
	@DateTimeFormat(iso = ISO.DATE)
	@NotNull(message = "입사일 누락")
	private LocalDate empHirdate;
	@NotBlank(message = "이름 누락")
	private String empName;
	@DateTimeFormat(iso = ISO.DATE)
	@NotNull(message = "생년월일 누락")
	private LocalDate empBir;
	@NotBlank(message = "전화번호 누락")
	private String empTel;
	@NotBlank(message = "성별 누락")
	private String empGen;
	@NotNull(message = "연봉 누락")
	@NumberFormat(style = Style.NUMBER)
	private Integer empSal;
	private String empSta;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate empRes;
	private String empFile;
	@NotBlank(message = "부서 누락")
	private String depId;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate curDate;

	// attencance
	private String atteId;
	private Integer atteTardy;
	private Integer atteAllAnLeave;
	private Integer atteLeftAnLeave;
	private Integer atteUseAnLeave;
	private String attendanceStatus;


	private AttencanceVO attencance;  // 연차

	private PmsApprovalVO pmsapproval;

	private PositionVO position;
	private DepartmentVO department;

//	private Set<WorkshiftVO> workshiftList;
	private List<WorkshiftVO> workshiftList;
}
