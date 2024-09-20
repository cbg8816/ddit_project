package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ExtcrgTypeDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ExtcrgTypeDefaultMapper {
    int deleteByPrimaryKey(String etId);

    int insert(ExtcrgTypeDefaultVO row);

    ExtcrgTypeDefaultVO selectByPrimaryKey(String etId);

    List<ExtcrgTypeDefaultVO> selectAll();

    int updateByPrimaryKey(ExtcrgTypeDefaultVO row);
}