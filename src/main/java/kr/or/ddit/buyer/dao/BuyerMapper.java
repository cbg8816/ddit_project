package kr.or.ddit.buyer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;

@Mapper
public interface BuyerMapper {
	public int insertBuyer(BuyerVO buyer);
	public BuyerVO selectBuyer(String buyerId);
	
	public int selectTotalRecord(PaginationInfo paging);
	
	public List<BuyerVO> selectBuyerList(PaginationInfo paging);
	public List<BuyerVO> selectAll();
	
	public int updateBuyer(BuyerVO buyer);
	
	public int deleteByPrimaryKey(String buyerId);
	
	public List<BuyerVO> findByLprodGu(String lprodGu);
}
