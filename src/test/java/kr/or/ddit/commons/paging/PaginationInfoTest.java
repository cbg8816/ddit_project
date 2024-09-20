package kr.or.ddit.commons.paging;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class PaginationInfoTest {

	@Test
	void test() {
		PaginationInfo paging = new PaginationInfo();
		paging.setTotalRecord(103);
		assertEquals(11, paging.getTotalPage());
		
		paging.setPage(3);
		assertEquals(30, paging.getLastRecord());
		assertEquals(21, paging.getFirstRecord());
		
		assertEquals(5, paging.getLastPage());
		assertEquals(1, paging.getFirstPage());
		
		paging.setPage(11);
		assertEquals(11, paging.getLastPage());
	}

}
