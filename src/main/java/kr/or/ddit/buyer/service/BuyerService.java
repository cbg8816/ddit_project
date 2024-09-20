package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;

public interface BuyerService {
	public void createBuyer(BuyerVO buyer);
	public BuyerVO retrieveBuyer(String buyerId);
	public List<BuyerVO> retrieveBuyerList(PaginationInfo paging);
	public void modifyBuyer(BuyerVO buyer);
	public void deleteBuyer(String buyerId);
	public List<BuyerVO> findLprodGu(String lprodGu);
}
