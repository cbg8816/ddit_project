package kr.or.ddit.member.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.vo.MemberVO;

@SpringJUnitConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Transactional // DB 자동 롤백기능.
//@ContextConfiguration("")
class MemberDAOTest {
	@Autowired
	MemberDAO memberDAO;
	
	@Test
	void testInsertMember() {
		MemberVO member = new MemberVO();
		member.setMemId("1");
		member.setMemName("1");
		member.setMemLoginId("1");
		member.setMemLoginPw("1");
		member.setMemEmail("1");
		member.setMemTel("1");
		
		assertEquals(1, memberDAO.insertMember(member));
	}

	@Test
	void testSelectMemberList() {
		assertNotNull(memberDAO.selectMemberList());
	}

	@Test
	void testSelectMember() {
		assertNotNull(memberDAO.selectMember("AB001"));
	}

	@Test
	void testUpdateMember() {
		MemberVO member = memberDAO.selectMember("1");
		member.setMemName("2");
		member.setMemLoginPw("2");
		member.setMemEmail("2");
		member.setMemTel("2");
		
		assertEquals(1, memberDAO.updateMember(member));
	}

	@Test
	void testDeleteMember() {
		assertEquals(1, memberDAO.deleteMember("1"));
	}

}
