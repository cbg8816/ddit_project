package kr.or.ddit.extracharges.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ExtrachargesVO;

@Mapper
public interface ExtrachargesDAO {
	/**
	 * 고객별 기타요금 조회
	 * @return
	 */
	public List<ExtrachargesVO> selectExt(String extcrgNo);

	/**
	 * 고객별 기타요금 추가
	 * @param extVO
	 * @return
	 */
	public int insertExt(ExtrachargesVO extVO);

	/**
	 * 고객별 기타요금 삭제
	 * @param extVO
	 * @return
	 */
	public int deleteExt(ExtrachargesVO extVO);

	/**
	 * 고객별 기타요금 수정
	 * @param extVO
	 * @return
	 */
	public int updateExt(ExtrachargesVO extVO);

	/**
	 * 고객별 기타요금 합계
	 * @param extcrgNo
	 * @return
	 */
	public int selectTotal(String extcrgNo);

	/**
	 * 고객별 기타요금 결제
	 * @param extVO
	 * @return
	 */
	public int updatePay(ExtrachargesVO extVO);
}
