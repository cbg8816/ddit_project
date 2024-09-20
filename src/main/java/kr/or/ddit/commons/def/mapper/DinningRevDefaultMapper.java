package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.DinningRevDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DinningRevDefaultMapper {
    int deleteByPrimaryKey(String dinId);

    int insert(DinningRevDefaultVO row);

    DinningRevDefaultVO selectByPrimaryKey(String dinId);

    List<DinningRevDefaultVO> selectAll();

    int updateByPrimaryKey(DinningRevDefaultVO row);
}