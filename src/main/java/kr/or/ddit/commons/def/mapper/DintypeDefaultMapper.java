package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.DintypeDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DintypeDefaultMapper {
    int deleteByPrimaryKey(String dintypeId);

    int insert(DintypeDefaultVO row);

    DintypeDefaultVO selectByPrimaryKey(String dintypeId);

    List<DintypeDefaultVO> selectAll();

    int updateByPrimaryKey(DintypeDefaultVO row);
}