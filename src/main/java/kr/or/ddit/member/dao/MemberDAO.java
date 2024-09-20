package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.MemberVO;

// C R U D
@Mapper
public interface MemberDAO {

	public int insertMember(MemberVO member);

	public List<MemberVO> selectMemberList();

	public MemberVO selectMember(String memId);

	public MemberVO selectMemberId(MemberVO member);

	public MemberVO selectMemberPw(MemberVO member);

	public int updateMember(MemberVO member);

	public int updateMemberPw(MemberVO member);

	public int deleteMember(String memId);
}
