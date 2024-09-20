package kr.or.ddit.revroom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.RevRoomVO;
import kr.or.ddit.vo.def.RevRoomDefaultVO;

@Mapper
public interface RevRoomDAO {

	public int insertRevRoom(RevRoomVO revroomId);

	public List<RevRoomVO> selectRevRoomList(String htrevId);

	public List<RevRoomVO> selectUseRoomList(PaginationInfo paging);

	public int selectTotalRecord(PaginationInfo paging); // 데이터 개수 조회

	public RevRoomVO selectRevRoom(String revroomId);

	public int updateRevRoom(RevRoomVO revroomId);

}
