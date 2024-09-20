package kr.or.ddit.buyer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.buyer.dao.BuyerMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;

@Service
public class BuyerServiceImpl implements BuyerService {
	@Autowired
	private BuyerMapper dao;

	@Override
	public void createBuyer(BuyerVO buyer) {
		dao.insertBuyer(buyer);
	}

	@Override
	public BuyerVO retrieveBuyer(String buyerId) {
		BuyerVO buyer = dao.selectBuyer(buyerId);
		return buyer;
	}

	@Override
	public List<BuyerVO> retrieveBuyerList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);		
		return dao.selectBuyerList(paging);
	}

	@Override
	public void modifyBuyer(BuyerVO buyer) {
		dao.updateBuyer(buyer);
	}

	@Override
	public void deleteBuyer(String buyerId) {
		dao.deleteByPrimaryKey(buyerId);
		
	}

	@Override
	public List<BuyerVO> findLprodGu(String lprodGu) {
		return dao.findByLprodGu(lprodGu);
	}
}















