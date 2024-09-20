package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.ProdVO;

public interface ProdService {
	public void createProd(ProdVO Prod);
	public ProdVO retrieveProd(String ProdId);
	public List<ProdVO> retrieveProdList(PaginationInfo paging);
	public void modifyProd(ProdVO Prod);
	public void deleteProd(String proId);
	public List<ProdVO> findBuyerId(String buyerId);
	public List<ProdVO> findByBuyerIdOrder(String buyerId);
}
