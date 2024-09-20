package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ExtrachargesDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ExtrachargesDefaultMapper {
    int deleteByPrimaryKey(@Param("extcrgNo") String extcrgNo, @Param("etId") String etId);

    int insert(ExtrachargesDefaultVO row);

    ExtrachargesDefaultVO selectByPrimaryKey(@Param("extcrgNo") String extcrgNo, @Param("etId") String etId);

    List<ExtrachargesDefaultVO> selectAll();

    int updateByPrimaryKey(ExtrachargesDefaultVO row);
}