package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.BrokenRoomDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BrokenRoomDefaultMapper {
    int deleteByPrimaryKey(String hkpNo);

    int insert(BrokenRoomDefaultVO row);

    BrokenRoomDefaultVO selectByPrimaryKey(String hkpNo);

    List<BrokenRoomDefaultVO> selectAll();

    int updateByPrimaryKey(BrokenRoomDefaultVO row);
}