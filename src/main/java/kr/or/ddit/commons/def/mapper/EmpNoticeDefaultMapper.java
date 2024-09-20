package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.EmpNoticeDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmpNoticeDefaultMapper {
    int deleteByPrimaryKey(Short empnotiNo);

    int insert(EmpNoticeDefaultVO row);

    EmpNoticeDefaultVO selectByPrimaryKey(Short empnotiNo);

    List<EmpNoticeDefaultVO> selectAll();

    int updateByPrimaryKey(EmpNoticeDefaultVO row);
}