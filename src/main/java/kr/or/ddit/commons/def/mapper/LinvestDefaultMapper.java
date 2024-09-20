package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.LinvestDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LinvestDefaultMapper {
    int deleteByPrimaryKey(String linvestId);

    int insert(LinvestDefaultVO row);

    LinvestDefaultVO selectByPrimaryKey(String linvestId);

    List<LinvestDefaultVO> selectAll();

    int updateByPrimaryKey(LinvestDefaultVO row);
}