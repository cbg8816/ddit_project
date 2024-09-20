package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ApprovalLineDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ApprovalLineDefaultMapper {
    int deleteByPrimaryKey(@Param("aprlineId") String aprlineId, @Param("aprId") String aprId);

    int insert(ApprovalLineDefaultVO row);

    ApprovalLineDefaultVO selectByPrimaryKey(@Param("aprlineId") String aprlineId, @Param("aprId") String aprId);

    List<ApprovalLineDefaultVO> selectAll();

    int updateByPrimaryKey(ApprovalLineDefaultVO row);
}