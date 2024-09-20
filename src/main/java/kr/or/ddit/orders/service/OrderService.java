package kr.or.ddit.orders.service;

import java.time.LocalDate;
import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.OrdersVO;

public interface OrderService {
	public void createOrders(OrdersVO orders);
	public List<OrdersVO> retrieveordersList(PaginationInfo paging);
	public List<OrdersVO> selectOrdersApply(LocalDate orderDate, String orderBuyer);
	public void modifyorders(String enter, String no);
	public void deleteorders(String ordersTurn);
	public List<OrdersVO> retrieveordersDetail(String ordersTurn);
}
