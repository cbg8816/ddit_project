package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.OrdersDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrdersDefaultMapper {
    int deleteByPrimaryKey(String orderTurn);

    int insert(OrdersDefaultVO row);

    OrdersDefaultVO selectByPrimaryKey(String orderTurn);

    List<OrdersDefaultVO> selectAll();

    int updateByPrimaryKey(OrdersDefaultVO row);
}