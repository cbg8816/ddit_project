package kr.or.ddit.housekeeping.dao;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.vo.def.HousekeepingDefaultVO;

@SpringJUnitWebConfig(locations="file:src/main/webapp/WEB-INF/springmvc/*-context.xml")
@Transactional
class HousekeepingMapperTest {

	@Autowired
	HousekeepingMapper mapper;

	HousekeepingDefaultVO keeping;



}
