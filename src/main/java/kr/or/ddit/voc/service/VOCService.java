package kr.or.ddit.voc.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.InquireVO;

/**
 * VOC Service interface
 *
 */
public interface VOCService {

	/**
	 * VOC LIST
	 * @return
	 */
	public List<InquireVO> selectVOCList(PaginationInfo paging);
}
