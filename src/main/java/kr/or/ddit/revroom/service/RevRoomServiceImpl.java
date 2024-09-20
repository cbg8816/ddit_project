package kr.or.ddit.revroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.revroom.dao.RevRoomDAO;
import kr.or.ddit.vo.RevRoomVO;
import kr.or.ddit.vo.def.RevRoomDefaultVO;

@Service
public class RevRoomServiceImpl implements RevRoomService {

	@Autowired
	private RevRoomDAO dao;

	@Override
	public void insertRevRoom(RevRoomDefaultVO revroomId) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<RevRoomDefaultVO> selectRevRoomList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RevRoomVO> selectUseRoomList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectUseRoomList(paging);
	}

	@Override
	public RevRoomDefaultVO selectRevRoom(String revroomId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateRevRoom(RevRoomDefaultVO revroomId) {
//		dao.updateRevRoom(revroomId);
	}




}
