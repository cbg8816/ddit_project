package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.HotelRevDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HotelRevDefaultMapper {
    int deleteByPrimaryKey(String htrevId);

    int insert(HotelRevDefaultVO row);

    HotelRevDefaultVO selectByPrimaryKey(String htrevId);

    List<HotelRevDefaultVO> selectAll();

    int updateByPrimaryKey(HotelRevDefaultVO row);
}