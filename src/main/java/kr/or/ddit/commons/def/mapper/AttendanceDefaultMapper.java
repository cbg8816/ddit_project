package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.AttendanceDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AttendanceDefaultMapper {
    int deleteByPrimaryKey(@Param("key") String key, @Param("empId") String empId);

    int insert(AttendanceDefaultVO row);

    AttendanceDefaultVO selectByPrimaryKey(@Param("key") String key, @Param("empId") String empId);

    List<AttendanceDefaultVO> selectAll();

    int updateByPrimaryKey(AttendanceDefaultVO row);
}