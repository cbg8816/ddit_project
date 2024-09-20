package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.PartyServiceDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PartyServiceDefaultMapper {
    int deleteByPrimaryKey(String partyNo);

    int insert(PartyServiceDefaultVO row);

    PartyServiceDefaultVO selectByPrimaryKey(String partyNo);

    List<PartyServiceDefaultVO> selectAll();

    int updateByPrimaryKey(PartyServiceDefaultVO row);
}