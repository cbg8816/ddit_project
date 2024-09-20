package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.InvestDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InvestDefaultMapper {
    int deleteByPrimaryKey(String investId);

    int insert(InvestDefaultVO row);

    InvestDefaultVO selectByPrimaryKey(String investId);

    List<InvestDefaultVO> selectAll();

    int updateByPrimaryKey(InvestDefaultVO row);
}