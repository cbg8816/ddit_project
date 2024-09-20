package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.NoticeDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDefaultMapper {
    int deleteByPrimaryKey(String notiNo);

    int insert(NoticeDefaultVO row);

    NoticeDefaultVO selectByPrimaryKey(String notiNo);

    List<NoticeDefaultVO> selectAll();

    int updateByPrimaryKey(NoticeDefaultVO row);
}