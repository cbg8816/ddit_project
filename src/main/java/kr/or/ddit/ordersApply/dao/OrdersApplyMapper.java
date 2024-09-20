package kr.or.ddit.ordersApply.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.OrdersApplyVO;
import kr.or.ddit.vo.OrdersVO;

@Mapper
public interface OrdersApplyMapper {
    public List<OrdersApplyVO> selectOrdersApply(PaginationInfo paging);
    public List<OrdersApplyVO> selectOrdersApplyDetail(String orderApplyNo);
    public OrdersApplyVO selectOrdersEnter(String ordereApplyNo);
    public int selectTotalRecord(PaginationInfo paging);
	public void insert(OrdersApplyVO orderApply);
	public void modifyorders(String string, String orderApplyNo);
	public void deleteByPrimaryKey(String orderApplyNo);
	public void updatePayment(String state, String enterOrder);
}