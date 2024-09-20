package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.PmsMailDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PmsMailDefaultMapper {
    int deleteByPrimaryKey(String mailId);

    int insert(PmsMailDefaultVO row);

    PmsMailDefaultVO selectByPrimaryKey(String mailId);

    List<PmsMailDefaultVO> selectAll();

    int updateByPrimaryKey(PmsMailDefaultVO row);
}