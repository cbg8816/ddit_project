package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.RevRoomDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RevRoomDefaultMapper {
    int deleteByPrimaryKey(String revroomId);

    int insert(RevRoomDefaultVO row);

    RevRoomDefaultVO selectByPrimaryKey(String revroomId);

    List<RevRoomDefaultVO> selectAll();

    int updateByPrimaryKey(RevRoomDefaultVO row);
}