package kr.or.ddit.inquire.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import kr.or.ddit.vo.InquireVO;

@SpringJUnitConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class InquireDAOTest {
	@Autowired
	InquireDAO inquireDAO;
	
	@Test
	void testInsertInquire() {
		InquireVO inquire = new InquireVO();
		inquire.setInqNo("4");
		inquire.setMemId("1");
		inquire.setInqTitle("1");
		inquire.setInqContent("1");
		inquire.setInqWriter("1");
		inquire.setInqCategory("1");
		
		assertEquals(1, inquireDAO.insertInquire(inquire));
	}

//	@Test
//	void testSelectInquireList() {
//		assertNotNull(inquireDAO.selectInquireList());
//	}

	@Test
	void testSelectInquire() {
		assertNotNull(inquireDAO.selectInquire("1"));
	}

	@Test
	void testUpdateInquire() {
		InquireVO inquire = inquireDAO.selectInquire("3");
		inquire.setInqTitle("2");
		inquire.setInqContent("2");
		inquire.setInqCategory("2");
		
		assertEquals(1, inquireDAO.updateInquire(inquire));
	}

	@Test
	void testDeleteInquire() {
		assertEquals(1, inquireDAO.deleteInquire("3"));
	}

}
