package kr.or.ddit.revroom.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.RevRoomVO;
import kr.or.ddit.vo.def.RevRoomDefaultVO;

public interface RevRoomService {

	public void insertRevRoom(RevRoomDefaultVO revroomId);

	public List<RevRoomDefaultVO> selectRevRoomList();

	public List<RevRoomVO> selectUseRoomList(PaginationInfo paging);

	public RevRoomDefaultVO selectRevRoom(String revroomId);

	public void updateRevRoom(RevRoomDefaultVO revroomId);

}
