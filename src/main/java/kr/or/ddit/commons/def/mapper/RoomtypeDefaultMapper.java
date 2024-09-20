package kr.or.ddit.commons.def.mapper;

import java.util.List;

import kr.or.ddit.vo.RoomtypeVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomtypeDefaultMapper {
    int deleteByPrimaryKey(String roomtypeId);

    int insert(RoomtypeDefaultVO row);

    RoomtypeDefaultVO selectByPrimaryKey(String roomtypeId);

    List<RoomtypeDefaultVO> selectAll();

    int updateByPrimaryKey(RoomtypeDefaultVO row);
}