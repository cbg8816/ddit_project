package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.EventJoinDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EventJoinDefaultMapper {
    int deleteByPrimaryKey(String eventjIdx);

    int insert(EventJoinDefaultVO row);

    EventJoinDefaultVO selectByPrimaryKey(String eventjIdx);

    List<EventJoinDefaultVO> selectAll();

    int updateByPrimaryKey(EventJoinDefaultVO row);
}