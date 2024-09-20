package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.PaystubDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PaystubDefaultMapper {
    int deleteByPrimaryKey(@Param("paystubYm") String paystubYm, @Param("empId") String empId);

    int insert(PaystubDefaultVO row);

    PaystubDefaultVO selectByPrimaryKey(@Param("paystubYm") String paystubYm, @Param("empId") String empId);

    List<PaystubDefaultVO> selectAll();

    int updateByPrimaryKey(PaystubDefaultVO row);
}