package kr.or.ddit.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.hotelrev.dao.HotelRevDAO;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.member.exception.UserNotFoundException;
import kr.or.ddit.vo.HotelRevVO;
import kr.or.ddit.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private HotelRevDAO hotelRevDAO;

	@Override
	public void insertMember(MemberVO member) {
		memberDAO.insertMember(member);
	}

	@Override
	public List<MemberVO> selectMemberList() {
		return memberDAO.selectMemberList();
	}

	@Override
	public MemberVO selectMember(String memId) {
		MemberVO member = new MemberVO();
		member = memberDAO.selectMember(memId);

		if(member == null) {
			throw new UserNotFoundException(memId);
		}

		return member;
	}

	@Override
	public MemberVO selectMemberId(MemberVO member) {
		MemberVO member1 = new MemberVO();
		member1 = memberDAO.selectMemberId(member);

		if(member1 == null) {
			throw new UserNotFoundException(member.getMemName());
		}

		return member1;
	}

	@Override
	public MemberVO selectMemberPw(MemberVO member) {
		MemberVO member1 = new MemberVO();
		member1 = memberDAO.selectMemberPw(member);

		if(member1 == null) {
			throw new UserNotFoundException(member.getMemName());
		}

		return member1;
	}

	@Override
	public void updateMember(MemberVO member) {
		memberDAO.updateMember(member);
	}

	@Override
	public void updateMemberPw(MemberVO member) {
		memberDAO.updateMemberPw(member);
	}

	@Override
	public void deleteMember(String memId) {
		memberDAO.deleteMember(memId);
	}

	// 회원 마이페이지 예약 조회
	@Override
	public List<HotelRevVO> selectHotelRevListMember(PaginationInfo paging) {
		int totalRecord = hotelRevDAO.selectTotalRecordMember(paging);
		paging.setTotalRecord(totalRecord);

		return hotelRevDAO.selectHotelRevListMember(paging);
	}
}
