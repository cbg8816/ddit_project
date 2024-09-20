package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.DepartmentDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DepartmentDefaultMapper {
    int deleteByPrimaryKey(String depId);

    int insert(DepartmentDefaultVO row);

    DepartmentDefaultVO selectByPrimaryKey(String depId);

    List<DepartmentDefaultVO> selectAll();

    int updateByPrimaryKey(DepartmentDefaultVO row);
}