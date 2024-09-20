package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.WorkDateDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkDateDefaultMapper {
    int deleteByPrimaryKey(Short workNo);

    int insert(WorkDateDefaultVO row);

    WorkDateDefaultVO selectByPrimaryKey(Short workNo);

    List<WorkDateDefaultVO> selectAll();

    int updateByPrimaryKey(WorkDateDefaultVO row);
}