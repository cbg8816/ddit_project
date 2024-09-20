package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.EnterDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EnterDefaultMapper {
    int deleteByPrimaryKey(String orderTurn);

    int insert(EnterDefaultVO row);

    EnterDefaultVO selectByPrimaryKey(String orderTurn);

    List<EnterDefaultVO> selectAll();

    int updateByPrimaryKey(EnterDefaultVO row);
}