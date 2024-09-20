package kr.or.ddit.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.def.TotalRevDefaultVO;
import lombok.Data;

@Data
public class PartyserviceVO {
	private String partyNo;
	private String venueNo;
	private String partyName;
	private LocalDate partyStart;
	private LocalDate partyEnd;
	private String partyRequest;
	private String partyPlatform;
	private String partyPayopt;
	private String partyRevst;
	private Integer partyPercent;

	private MemberVO member;  // has a 관계
	private TotalRevDefaultVO total; // has a  관계
}
