package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.WorkShiftDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface WorkShiftDefaultMapper {
    int deleteByPrimaryKey(@Param("workId") String workId, @Param("empId") String empId);

    int insert(WorkShiftDefaultVO row);

    WorkShiftDefaultVO selectByPrimaryKey(@Param("workId") String workId, @Param("empId") String empId);

    List<WorkShiftDefaultVO> selectAll();

    int updateByPrimaryKey(WorkShiftDefaultVO row);
}