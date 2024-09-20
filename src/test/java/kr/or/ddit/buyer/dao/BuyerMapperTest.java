package kr.or.ddit.buyer.dao;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.ProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class BuyerMapperTest {

	@Autowired
	BuyerMapper mapper;
	
	@Test
	void testInsertBuyer() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectBuyer() {
		BuyerVO buyer = mapper.selectBuyer("P10101");
		log.info("조회 결과 : {}", buyer);
	}

	@Test
	void testSelectTotalRecord() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectBuyerList() {
		assertDoesNotThrow(()->mapper.selectBuyerList(null));
	}

	@Test
	void testUpdateBuyer() {
		fail("Not yet implemented");
	}

}
