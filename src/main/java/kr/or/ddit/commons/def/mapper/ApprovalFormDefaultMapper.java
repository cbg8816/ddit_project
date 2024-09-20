package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ApprovalFormDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalFormDefaultMapper {
    int deleteByPrimaryKey(String formId);

    int insert(ApprovalFormDefaultVO row);

    ApprovalFormDefaultVO selectByPrimaryKey(String formId);

    List<ApprovalFormDefaultVO> selectAll();

    int updateByPrimaryKey(ApprovalFormDefaultVO row);
}