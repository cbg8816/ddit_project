package kr.or.ddit.orders.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.OrdersVO;
import kr.or.ddit.vo.ProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class OrdersMapperTest {

	@Autowired
	OrdersMapper mapper;
	
	@Test
	void testDeleteByPrimaryKey() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectAll() {
		assertDoesNotThrow(()->mapper.selectAll(null));
	}

	@Test
	void testUpdateByPrimaryKey() {
		fail("Not yet implemented");
	}
	

}
