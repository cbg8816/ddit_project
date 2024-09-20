package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.EventDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EventDefaultMapper {
    int deleteByPrimaryKey(String eventId);

    int insert(EventDefaultVO row);

    EventDefaultVO selectByPrimaryKey(String eventId);

    List<EventDefaultVO> selectAll();

    int updateByPrimaryKey(EventDefaultVO row);
}