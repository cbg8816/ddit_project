package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.MailSendDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MailSendDefaultMapper {
    int deleteByPrimaryKey(@Param("mailSendNo") String mailSendNo, @Param("mailSender") String mailSender, @Param("mailId") String mailId);

    int insert(MailSendDefaultVO row);

    MailSendDefaultVO selectByPrimaryKey(@Param("mailSendNo") String mailSendNo, @Param("mailSender") String mailSender, @Param("mailId") String mailId);

    List<MailSendDefaultVO> selectAll();

    int updateByPrimaryKey(MailSendDefaultVO row);
}