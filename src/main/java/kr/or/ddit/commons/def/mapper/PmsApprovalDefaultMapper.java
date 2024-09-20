package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.PmsApprovalDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PmsApprovalDefaultMapper {
    int deleteByPrimaryKey(String aprId);

    int insert(PmsApprovalDefaultVO row);

    PmsApprovalDefaultVO selectByPrimaryKey(String aprId);

    List<PmsApprovalDefaultVO> selectAll();

    int updateByPrimaryKey(PmsApprovalDefaultVO row);
}