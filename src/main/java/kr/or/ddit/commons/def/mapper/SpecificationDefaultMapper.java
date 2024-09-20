package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.SpecificationDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SpecificationDefaultMapper {
    int deleteByPrimaryKey(String speId);

    int insert(SpecificationDefaultVO row);

    SpecificationDefaultVO selectByPrimaryKey(String speId);

    List<SpecificationDefaultVO> selectAll();

    int updateByPrimaryKey(SpecificationDefaultVO row);
}