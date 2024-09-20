package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.MailReceiveDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MailReceiveDefaultMapper {
    int deleteByPrimaryKey(@Param("mailRecvNo") String mailRecvNo, @Param("mailReceiver") String mailReceiver, @Param("mailId") String mailId);

    int insert(MailReceiveDefaultVO row);

    MailReceiveDefaultVO selectByPrimaryKey(@Param("mailRecvNo") String mailRecvNo, @Param("mailReceiver") String mailReceiver, @Param("mailId") String mailId);

    List<MailReceiveDefaultVO> selectAll();

    int updateByPrimaryKey(MailReceiveDefaultVO row);
}