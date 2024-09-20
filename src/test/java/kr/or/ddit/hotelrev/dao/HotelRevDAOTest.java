package kr.or.ddit.hotelrev.dao;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.transaction.annotation.Transactional;

@SpringJUnitConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Transactional // DB 자동 롤백기능.
class HotelRevDAOTest {
	@Autowired
	HotelRevDAO hotelRevDao;

	@Test
	void testInsertHotelRev() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectHotelRev() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectHotelRevList() {
//		assertNotNull(hotelRevDao.selectHotelRevList());
	}

	@Test
	void testUpdateHotelRev() {
		fail("Not yet implemented");
	}

}
