package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.CodetypeDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CodetypeDefaultMapper {
    int deleteByPrimaryKey(String cdtypeId);

    int insert(CodetypeDefaultVO row);

    CodetypeDefaultVO selectByPrimaryKey(String cdtypeId);

    List<CodetypeDefaultVO> selectAll();

    int updateByPrimaryKey(CodetypeDefaultVO row);
}