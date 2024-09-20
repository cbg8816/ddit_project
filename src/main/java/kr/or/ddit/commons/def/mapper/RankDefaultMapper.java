package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.RankDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RankDefaultMapper {
    int deleteByPrimaryKey(String rankCode);

    int insert(RankDefaultVO row);

    RankDefaultVO selectByPrimaryKey(String rankCode);

    List<RankDefaultVO> selectAll();

    int updateByPrimaryKey(RankDefaultVO row);
}