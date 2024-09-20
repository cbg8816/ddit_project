package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ScheduleDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDefaultMapper {
    int deleteByPrimaryKey(String empId);

    int insert(ScheduleDefaultVO row);

    ScheduleDefaultVO selectByPrimaryKey(String empId);

    List<ScheduleDefaultVO> selectAll();

    int updateByPrimaryKey(ScheduleDefaultVO row);
}