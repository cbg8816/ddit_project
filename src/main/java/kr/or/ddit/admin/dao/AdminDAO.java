package kr.or.ddit.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AdminVO;

/**
 * AdminDAO(관리자 DAO).
 *
 */
@Mapper
public interface AdminDAO {
	/**
	 * 회원 목록.
	 * @return
	 */
	public List<AdminVO> selectnList(PaginationInfo paging);

	/**
	 * 회원 목록 총 개수.
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);
}
