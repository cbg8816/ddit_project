package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.AtchDetailDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AtchDetailDefaultMapper {
    int deleteByPrimaryKey(@Param("atchDetailId") String atchDetailId, @Param("atchFileId") String atchFileId);

    int insert(AtchDetailDefaultVO row);

    AtchDetailDefaultVO selectByPrimaryKey(@Param("atchDetailId") String atchDetailId, @Param("atchFileId") String atchFileId);

    List<AtchDetailDefaultVO> selectAll();

    int updateByPrimaryKey(AtchDetailDefaultVO row);
}