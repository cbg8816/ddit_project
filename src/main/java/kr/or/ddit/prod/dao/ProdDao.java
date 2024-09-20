package kr.or.ddit.prod.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.ProdVO;

@Mapper
public interface ProdDao {
	public int insertProd(ProdVO prod);
	public ProdVO selectProd(String prodId);
	public int selectTotalRecord(PaginationInfo paging); 
	public List<ProdVO> selectProdList(PaginationInfo paging);
	public int updateProd(ProdVO prod);
	public int deleteByPrimaryKey(String prodId);
	public List<ProdVO> selectProdListNoPaging();
	public List<ProdVO> findByBuyerId(String buyerId);
	public List<ProdVO> findByBuyerIdOrder(String buyerId);
	public int updateProdQty(ProdVO prod);
	public void updateProdQty(Integer enterQty,String enterId);
}
