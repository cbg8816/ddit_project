package kr.or.ddit.ordersApply.service;

import java.time.LocalDate;
import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.OrdersApplyVO;
import kr.or.ddit.vo.OrdersVO;

public interface OrderApplyService {
	public List<OrdersApplyVO> selectOrdersApply(PaginationInfo paging);
	public List<OrdersApplyVO> selectOrdersApplyDetail(String orderApplyNo);
	public OrdersApplyVO selectOrdersEnter(String ordereApplyNo);
	public void insert(OrdersApplyVO orderApply);
}
