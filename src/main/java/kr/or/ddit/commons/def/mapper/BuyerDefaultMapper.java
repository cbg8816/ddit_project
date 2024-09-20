package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.BuyerDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BuyerDefaultMapper {
    int deleteByPrimaryKey(String buyerId);

    int insert(BuyerDefaultVO row);

    BuyerDefaultVO selectByPrimaryKey(String buyerId);

    List<BuyerDefaultVO> selectAll();

    int updateByPrimaryKey(BuyerDefaultVO row);
}