package kr.or.ddit.admin.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AdminVO;

/**
 * AdminService(관리자 Service).
 *
 */
public interface AdminService {
	/**
	 * 회원 목록.
	 * @return
	 */
	public List<AdminVO> selectnList(PaginationInfo paging);
}
