package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.AttendanceDetailDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceDetailDefaultMapper {
    int deleteByPrimaryKey(String key);

    int insert(AttendanceDetailDefaultVO row);

    AttendanceDetailDefaultVO selectByPrimaryKey(String key);

    List<AttendanceDetailDefaultVO> selectAll();

    int updateByPrimaryKey(AttendanceDetailDefaultVO row);
}