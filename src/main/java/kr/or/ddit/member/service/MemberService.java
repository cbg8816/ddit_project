package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.HotelRevVO;
import kr.or.ddit.vo.MemberVO;

public interface MemberService {

	public void insertMember(MemberVO member);

	public List<MemberVO> selectMemberList();

	public MemberVO selectMember(String memId);

	public MemberVO selectMemberId(MemberVO member);

	public MemberVO selectMemberPw(MemberVO member);

	public void updateMember(MemberVO member);

	public void updateMemberPw(MemberVO member);

	public void deleteMember(String memId);

	// 회원 마이페이지 예약 조회
	public List<HotelRevVO> selectHotelRevListMember(PaginationInfo paging);
}
