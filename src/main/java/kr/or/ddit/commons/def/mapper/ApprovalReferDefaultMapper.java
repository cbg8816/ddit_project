package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ApprovalReferDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalReferDefaultMapper {
    int deleteByPrimaryKey(String aprRefId);

    int insert(ApprovalReferDefaultVO row);

    ApprovalReferDefaultVO selectByPrimaryKey(String aprRefId);

    List<ApprovalReferDefaultVO> selectAll();

    int updateByPrimaryKey(ApprovalReferDefaultVO row);
}