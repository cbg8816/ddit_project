package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.PackageDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PackageDefaultMapper {
    int deleteByPrimaryKey(String packageId);

    int insert(PackageDefaultVO row);

    PackageDefaultVO selectByPrimaryKey(String packageId);

    List<PackageDefaultVO> selectAll();

    int updateByPrimaryKey(PackageDefaultVO row);
}