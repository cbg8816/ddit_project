package kr.or.ddit.extcrgtype.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ExtcrgTypeVO;

/**
 * 기타요금 DAO
 *
 */
@Mapper
public interface ExtcrgTypeDAO {
	/**
	 * 기타요금 목록
	 * @return
	 */
	public List<ExtcrgTypeVO> selectExtList();

	/**
	 * 기타요금 가격
	 * @param etId
	 * @return
	 */
	public int selectExtPrice(String etId);
}
