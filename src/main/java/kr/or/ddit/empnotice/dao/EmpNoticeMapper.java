package kr.or.ddit.empnotice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EmpNoticeVO;
import kr.or.ddit.vo.EmpVO;

@Mapper
public interface EmpNoticeMapper {
	/**
	 * 페이징 할때 전체 레코드 수
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);

	/**
	 * 사내공지사항 전체리스트
	 * @param paging
	 * @return
	 */
	public List<EmpNoticeVO> selectEmpNoticeList(PaginationInfo paging);
	/**
	 * 사내공지사항 상세
	 * @param empnotiNo
	 * @return
	 */
	public EmpNoticeVO selectEmpNotice(String empnotiNo);
	/**
	 * 사내공지사항 등록
	 * @param empNotice
	 * @return
	 */
	public int insertEmpNotice(EmpNoticeVO empNotice);
	/**
	 * 사내공지사항 수정
	 * @param empNotice
	 * @return
	 */
	public int updateEmpNotice(EmpNoticeVO empNotice);
	/**
	 * 사내공지사항 삭제
	 * @param empnotiNo
	 * @return
	 */
	public int deleteEmpNotice(String empnotiNo);




	public EmpVO empallList(String empId);
}
