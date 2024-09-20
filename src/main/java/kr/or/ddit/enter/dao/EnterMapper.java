package kr.or.ddit.enter.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EnterVO;

@Mapper
public interface EnterMapper {
	  public int deleteByPrimaryKey(String orderTurn);
	  public int insert(EnterVO row);
	  public int selectTotalRecord(PaginationInfo paging); 
	  public EnterVO selectByPrimaryKey(String orderTurn);
	  public List<EnterVO> selectAll(PaginationInfo paging);
	  public List<EnterVO> withdrawalEnterList(PaginationInfo paging);
	  public int updateByPrimaryKey(EnterVO row);
	  public void updateState(String enterWith ,String enterTurn);
}
