package kr.or.ddit.commons.def.mapper;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.HousekeepingDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HousekeepingDefaultMapper {
    int deleteByPrimaryKey(String hkpNo);

    int insert(HousekeepingDefaultVO row);

    HousekeepingDefaultVO selectByPrimaryKey(String hkpNo);

    List<HousekeepingDefaultVO> selectAll(PaginationInfo paging);

    int updateByPrimaryKey(HousekeepingDefaultVO row);
    
    int selectTotalRecord(PaginationInfo paging);
}