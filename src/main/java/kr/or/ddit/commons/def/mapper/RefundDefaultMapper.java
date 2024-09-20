package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.RefundDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface RefundDefaultMapper {
    int deleteByPrimaryKey(@Param("refundId") String refundId, @Param("payId") String payId);

    int insert(RefundDefaultVO row);

    RefundDefaultVO selectByPrimaryKey(@Param("refundId") String refundId, @Param("payId") String payId);

    List<RefundDefaultVO> selectAll();

    int updateByPrimaryKey(RefundDefaultVO row);
}