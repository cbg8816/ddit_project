package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.DateslotDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DateslotDefaultMapper {
    int deleteByPrimaryKey(String dateslotId);

    int insert(DateslotDefaultVO row);

    DateslotDefaultVO selectByPrimaryKey(String dateslotId);

    List<DateslotDefaultVO> selectAll();

    int updateByPrimaryKey(DateslotDefaultVO row);
}