package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.MemoDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemoDefaultMapper {
    int insert(MemoDefaultVO row);

    List<MemoDefaultVO> selectAll();
}