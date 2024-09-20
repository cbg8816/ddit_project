package kr.or.ddit.dinningrev.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.DinningRevVO;
import kr.or.ddit.vo.HotelRevVO;

@Mapper
public interface DinningRevDAO {

	public int insertMember(DinningRevVO dinRev);
	public int insertTotalRev(DinningRevVO dinRev);
	public int insertDinRev(DinningRevVO dinRev);



	public int selectTotalRecord(PaginationInfo paging); // 데이터 개수 조회

	public DinningRevVO selectDinRev(String what);

	public List<DinningRevVO> selectDinRevList(PaginationInfo paging);

	public int updateDinRev(DinningRevVO dinRev);
	public int updateTotalRev(DinningRevVO dinRev);




}
