package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.CodeDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CodeDefaultMapper {
    int deleteByPrimaryKey(@Param("code") String code, @Param("cdtypeId") String cdtypeId);

    int insert(CodeDefaultVO row);

    CodeDefaultVO selectByPrimaryKey(@Param("code") String code, @Param("cdtypeId") String cdtypeId);

    List<CodeDefaultVO> selectAll();

    int updateByPrimaryKey(CodeDefaultVO row);
}