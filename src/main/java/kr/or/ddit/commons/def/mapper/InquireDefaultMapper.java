package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.InquireDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InquireDefaultMapper {
    int deleteByPrimaryKey(String inqNo);

    int insert(InquireDefaultVO row);

    InquireDefaultVO selectByPrimaryKey(String inqNo);

    List<InquireDefaultVO> selectAll();

    int updateByPrimaryKey(InquireDefaultVO row);
}