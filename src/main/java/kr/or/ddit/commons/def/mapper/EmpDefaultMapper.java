package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.EmpDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmpDefaultMapper {
    int deleteByPrimaryKey(String empId);

    int insert(EmpDefaultVO row);

    EmpDefaultVO selectByPrimaryKey(String empId);

    List<EmpDefaultVO> selectAll();

    int updateByPrimaryKey(EmpDefaultVO row);
}