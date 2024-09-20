package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ForRevMemberVO {
	private String memId;
	private String rankCode;
	private String rankName;
	private double rankMlgPer;
	private String memName;
	private String memLoginId;
	private String memEmail;
	private String memTel;
	private int memMil;
}
