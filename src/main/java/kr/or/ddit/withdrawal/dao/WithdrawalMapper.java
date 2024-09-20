package kr.or.ddit.withdrawal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EnterVO;
import kr.or.ddit.vo.OrdersApplyVO;
import kr.or.ddit.vo.WithdrawalVO;

@Mapper
public interface WithdrawalMapper {
	public void insert(WithdrawalVO withdrawal);
	public int updateBuyer(WithdrawalVO withdrawal);
	public int deleteByPrimaryKey(String withdrawalNo);
	
	public int selectTotalRecord(PaginationInfo paging);
	public List<WithdrawalVO> selectwithdrawalList(PaginationInfo paging);
	public List<WithdrawalVO> selectRemainList(PaginationInfo paging);
	public List<EnterVO> selectwithdrawalRemainList(PaginationInfo paging);
	
	public List<WithdrawalVO> selectAll();
	
	public List<OrdersApplyVO> selectWithdrawal(String withdrawalNo);
	
	
	
	
}
