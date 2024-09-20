package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.PayDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayDefaultMapper {
    int deleteByPrimaryKey(String payId);

    int insert(PayDefaultVO row);

    PayDefaultVO selectByPrimaryKey(String payId);

    List<PayDefaultVO> selectAll();

    int updateByPrimaryKey(PayDefaultVO row);
}