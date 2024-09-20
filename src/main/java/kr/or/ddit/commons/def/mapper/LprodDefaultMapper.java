package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.LprodDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LprodDefaultMapper {
    int deleteByPrimaryKey(String lprodGu);

    int insert(LprodDefaultVO row);

    LprodDefaultVO selectByPrimaryKey(String lprodGu);

    List<LprodDefaultVO> selectAll();

    int updateByPrimaryKey(LprodDefaultVO row);
}