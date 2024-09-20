package kr.or.ddit.prod.service;

import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.prod.dao.ProdDao;
import kr.or.ddit.vo.ProdVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
public class ProdServiceImpl implements ProdService {
	
	private final ProdDao dao;
	
	@Transactional
	@Override
	public void createProd(ProdVO prod) {
		dao.insertProd(prod);
	}


	@Override
	public ProdVO retrieveProd(String prodId) {
		ProdVO prod = dao.selectProd(prodId);
		return prod;
	}

	@Override
	public List<ProdVO> retrieveProdList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectProdList(paging);
	}
	@Transactional
	@Override
	public void modifyProd(ProdVO Prod) {
		dao.updateProd(Prod);
	}


	@Override
	public void deleteProd(String proId) {
		dao.deleteByPrimaryKey(proId);
	}


	@Override
	public List<ProdVO> findBuyerId(String buyerId) {
		return dao.findByBuyerId(buyerId);
	}


	@Override
	public List<ProdVO> findByBuyerIdOrder(String buyerId) {
		return dao.findByBuyerIdOrder(buyerId);
	}	
}



















