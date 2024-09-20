package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.EventVenueDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EventVenueDefaultMapper {
    int deleteByPrimaryKey(String venueNo);

    int insert(EventVenueDefaultVO row);

    EventVenueDefaultVO selectByPrimaryKey(String venueNo);

    List<EventVenueDefaultVO> selectAll();

    int updateByPrimaryKey(EventVenueDefaultVO row);
}