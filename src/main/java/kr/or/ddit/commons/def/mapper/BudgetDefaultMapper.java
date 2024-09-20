package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.BudgetDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BudgetDefaultMapper {
    int deleteByPrimaryKey(String budId);

    int insert(BudgetDefaultVO row);

    BudgetDefaultVO selectByPrimaryKey(String budId);

    List<BudgetDefaultVO> selectAll();

    int updateByPrimaryKey(BudgetDefaultVO row);
}