package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.MemberDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDefaultMapper {
    int deleteByPrimaryKey(String memId);

    int insert(MemberDefaultVO row);

    MemberDefaultVO selectByPrimaryKey(String memId);

    List<MemberDefaultVO> selectAll();

    int updateByPrimaryKey(MemberDefaultVO row);
}