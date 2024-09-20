package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.PositionDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PositionDefaultMapper {
    int deleteByPrimaryKey(String posiId);

    int insert(PositionDefaultVO row);

    PositionDefaultVO selectByPrimaryKey(String posiId);

    List<PositionDefaultVO> selectAll();

    int updateByPrimaryKey(PositionDefaultVO row);
}