package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.RoomstatusDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface RoomstatusDefaultMapper {
    int deleteByPrimaryKey(@Param("roomId") String roomId, @Param("roomtypeId") String roomtypeId);

    int insert(RoomstatusDefaultVO row);

    RoomstatusDefaultVO selectByPrimaryKey(@Param("roomId") String roomId, @Param("roomtypeId") String roomtypeId);

    List<RoomstatusDefaultVO> selectAll();

    int updateByPrimaryKey(RoomstatusDefaultVO row);
}