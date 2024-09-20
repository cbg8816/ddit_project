package kr.or.ddit.approval.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.approval.dao.ApprovalFormMapper;
import kr.or.ddit.approval.dao.ApprovalMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.ApprovalFav;
import kr.or.ddit.vo.ApprovalFormVO;
import kr.or.ddit.vo.ApprovalLineVO;
import kr.or.ddit.vo.AttencanceVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PmsApprovalVO;

@Service
public class ApprovalFormServiceImpl implements ApprovalFormService {

	@Autowired
	private ApprovalFormMapper formdao;

	@Autowired
	private ApprovalMapper dao;

	private Map<String, String> titletoFileMap;


	// modal 양식 이동하기 위한 map
	public ApprovalFormServiceImpl() {
		titletoFileMap = new HashMap<>();
		titletoFileMap.put("교통비신청", "transportation_request");
		titletoFileMap.put("구매품의서", "purchase_request");
		titletoFileMap.put("매출보고서", "sales_report");
		titletoFileMap.put("법인카드 발급신청서", "corporate_card_request");
		titletoFileMap.put("사무용품신청서", "office_supplies_request");
		titletoFileMap.put("연차신청서", "annual");
		titletoFileMap.put("유류대신청", "fuel_request");
		titletoFileMap.put("조퇴신청서", "early_leave_request");
		titletoFileMap.put("지출결의서", "expense_report");
		titletoFileMap.put("휴일근무신청서", "holiday_work_request");
		titletoFileMap.put("휴직원", "leave_of_absence");

	}


	// approvalForm 전체리스트 뽑기
	@Override
	public List<ApprovalFormVO> retrieveApprovalformList() {
		return formdao.approvalformList();
	}

	public String getFileNameForTitle(String title) {
		return titletoFileMap.getOrDefault(title,"default.jsp");
	}

//	보관함 리스트
	@Override
	public List<PmsApprovalVO> pmsapprovalboxList(PaginationInfo paging) {
		return dao.approvalboxList(paging);
	}

	//결재요청
	@Override
	public List<PmsApprovalVO> requestboxList(PaginationInfo paging) {
		return dao.requestboxList(paging);
	}

	//완료
	@Override
	public List<PmsApprovalVO> selectCompletedApprovals(PaginationInfo paging) {
		return dao.completedApprovals(paging);
	}

	//반려
	@Override
	public List<PmsApprovalVO> selectreturnApprovals(PaginationInfo paging) {
		return dao.returnApprovals(paging);
	}




	@Override
	public AttencanceVO retrieveAttencanceByEmpId(String empId) {
		return dao.selectAttencanceByEmpId(empId);
	}


	@Override
	public void annualcreate(PmsApprovalVO pmsapproval) {
		dao.annualupdate(pmsapproval);

	}


	@Override
	public List<PmsApprovalVO> allList() {
		return dao.allList();
	}


	@Override
	public PmsApprovalVO detailAppro(String aprId) {
		return dao.detailAppro(aprId);
	}


	@Override
	public void linecreate(PmsApprovalVO pmsapproval) {
		if(pmsapproval.getLineList() != null && pmsapproval.getLineList().size() > 0) {
			String aprId = pmsapproval.getAprId();
			for(int i = 0; i < pmsapproval.getLineList().size(); i++) {
				ApprovalLineVO lineVO = pmsapproval.getLineList().get(i);
				if(i == 0) {
					lineVO.setAprlineState("2");
				}else {
					lineVO.setAprlineState("1");
				}
				lineVO.setAprlineTurn(i);
				lineVO.setAprId(aprId);
				dao.linecreate(lineVO);
			}
		}
	}





}
