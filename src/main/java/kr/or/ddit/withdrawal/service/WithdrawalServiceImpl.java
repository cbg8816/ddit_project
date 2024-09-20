package kr.or.ddit.withdrawal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EnterVO;
import kr.or.ddit.vo.OrdersApplyVO;
import kr.or.ddit.vo.WithdrawalVO;
import kr.or.ddit.withdrawal.dao.WithdrawalMapper;

@Service
public class WithdrawalServiceImpl implements WithdrawalService {
	
	@Autowired
	WithdrawalMapper dao;
	
	@Override
	public void insert(WithdrawalVO withdrawal) {
		dao.insert(withdrawal);
	}

	@Override
	public int updateBuyer(WithdrawalVO withdrawal) {
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(String withdrawalNo) {
		return 0;
	}

	@Override
	public int selectTotalRecord(PaginationInfo paging) {
		return 0;
	}

	@Override
	public List<WithdrawalVO> selectwithdrawalList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);		
		return dao.selectwithdrawalList(paging);
	}

	@Override
	public List<WithdrawalVO> selectAll() {
		return null;
	}

	@Override
	public List<OrdersApplyVO> selectWithdrawal(String withdrawalNo) {
		return dao.selectWithdrawal(withdrawalNo);
	}

	@Override
	public List<EnterVO> selectwithdrawalRemainList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);		
		return dao.selectwithdrawalRemainList(paging);
	}

	@Override
	public List<WithdrawalVO> selectRemainList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);		
		return dao.selectRemainList(paging);
	}

}
