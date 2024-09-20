package kr.or.ddit.orders.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.OrdersVO;

@Mapper
public interface OrdersMapper {
	public int insert(OrdersVO row);
    public List<OrdersVO> selectByPrimaryKey(String orderTurn);
    public int selectTotalRecord(PaginationInfo paging); 
    public List<OrdersVO> selectAll(PaginationInfo paging);
    public List<OrdersVO> selectOrdersApply(LocalDate orderDate, String orderBuyer);
    public int updateByPrimaryKey(String enter,String no);
    public int deleteByPrimaryKey(String orderTurn);
    public OrdersVO selectOrder(LocalDate orderDate, String orderBuyer);
}