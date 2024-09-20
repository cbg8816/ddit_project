package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * AdminVO(관리자 VO).
 * 회원고유ID, 등급코드, 회원명, 로그인아이디, 로그인비밀번호, 이메일, 전화번호, 탈퇴여부, 회원구분.
 * LocalDate => @DateTimeFormat(iso = ISO.DATE)
 */
@Data
@EqualsAndHashCode(of = "memId")
public class AdminVO implements Serializable {
	private String memId;
	private String rankCode;
	private String memName;
	private String memLoginId;
	private String memLoginPw;
	private String memEmail;
	private String memTel;
	private String memYn;
	private String memRole;
	private String no;
}
