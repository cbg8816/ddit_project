package kr.or.ddit.totalrev.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.RoomtypeDefaultMapper;
import kr.or.ddit.commons.def.mapper.TotalRevDefaultMapper;
import kr.or.ddit.mileage.dao.MileageDAO;
import kr.or.ddit.totalrev.dao.totalRevMapper;
import kr.or.ddit.vo.RoomtypeVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;

@Service
public class totalRevServiceImpl implements totalRevService{

	@Autowired
	MileageDAO milDao;
	@Autowired
	RoomtypeDefaultMapper roomDao;
	
	@Override
	public RoomtypeDefaultVO roomTypeData(String roomStr) {
		return roomDao.selectByPrimaryKey(roomStr);
	}

	@Override
	public int selectMemMil(String memId) {
		return milDao.selectMileageTotal(memId);
	}

}
