package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ApprovalFavDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalFavDefaultMapper {
    int insert(ApprovalFavDefaultVO row);

    List<ApprovalFavDefaultVO> selectAll();
}