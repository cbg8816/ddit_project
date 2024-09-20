package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.RoomDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface RoomDefaultMapper {
    int deleteByPrimaryKey(@Param("roomId") String roomId, @Param("roomtypeId") String roomtypeId);

    int insert(RoomDefaultVO row);

    RoomDefaultVO selectByPrimaryKey(@Param("roomId") String roomId, @Param("roomtypeId") String roomtypeId);

    List<RoomDefaultVO> selectAll();

    int updateByPrimaryKey(RoomDefaultVO row);
}