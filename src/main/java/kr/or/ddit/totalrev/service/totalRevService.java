package kr.or.ddit.totalrev.service;

import kr.or.ddit.vo.RoomtypeVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;

public interface totalRevService {

	public RoomtypeDefaultVO roomTypeData(String roomStr);
	
	public int selectMemMil(String memId);
	
}
