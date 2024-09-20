package kr.or.ddit.vo;

import java.io.Serializable;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.validate.groups.UpdateMemPW;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * VO F.W -> lombok, hybernate validator.
 * XML F.W -> Mybatis.
 *
 * 1. Entity의 기본 스키마 구조.
 * 2. Entity간 관계 반영.
 *    has A.
 *    has Many.
 * 3. Constraint -> hybernate validator constraint annotation으로 반영.
 */

@Data
@EqualsAndHashCode(of = "memId")
public class MemberVO implements Serializable{
	private String memId;
	private String rankCode;

	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class}, message = "필수사항입니다.")
	@Size(max=6, message = "이름의 길이는 6글자 제한입니다.")
	private String memName;

//	@NotBlank(groups = InsertGroup.class, message = "필수사항입니다.")
	@Pattern(regexp = "(?=.*[a-z])(?=.*\\d).{8,16}", message = "영문 소문자, 숫자를 포함한 8~16 문자로 입력해주세요.")
	private String memLoginId;

//	@NotBlank(groups = InsertGroup.class, message = "필수사항입니다.")
	@NotBlank(groups = UpdateMemPW.class)
	@Pattern(regexp = "(?=.*[a-z])(?=.*\\d)(?=.*[@\\$\\^\\*]).{8,16}", message = "영문 소문자, 숫자, 특수 문자(@,$,^,*)를 포함한 8~16 문자로 입력해주세요.")
	private String memLoginPw;

	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class}, message = "필수사항입니다.")
	@Email(groups = InsertGroup.class)
	private String memEmail;

//	@NotBlank(groups = InsertGroup.class, message = "필수사항입니다.")
	@NotBlank(groups = UpdateGroup.class, message = "필수사항입니다.")
	@Pattern(regexp = "\\d{3}-\\d{3,4}-\\d{4}", message = "올바른 전화번호를 입력해 주세요.")
	private String memTel;
	private String memYn;
	private String memRole;
}
