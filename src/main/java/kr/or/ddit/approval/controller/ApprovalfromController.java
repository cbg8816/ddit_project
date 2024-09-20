package kr.or.ddit.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.approval.dao.ApprovalMapper;
import kr.or.ddit.approval.service.ApprovalFormService;
import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.vo.ApprovalFormVO;
import kr.or.ddit.vo.AttencanceVO;
import kr.or.ddit.vo.EmpNoticeVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PmsApprovalVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ApprovalfromController {


	@Autowired
	private ApprovalMapper approvaldao;

	@Autowired
	private ApprovalFormService formservice;

	  @GetMapping("/api/employees")
	  @ResponseBody
	    public List<Map<String, Object>> getEmployees() {

	        List<EmpVO> employees = approvaldao.selectEmployees();

	     // 트리 구조로 변환
	        Map<String, Map<String, Object>> departmentMap = new HashMap<>();
	        for (EmpVO employee : employees) {
	            String department = employee.getDepartment().getDepNm(); //팀
	            String empName = employee.getEmpName();  // 이름
	            String posiName = employee.getPosition().getPosiNm(); // 직급

	            // 부서 데이터 가져오기 또는 새로 생성
	            Map<String, Object> departmentData = departmentMap.computeIfAbsent(department, k -> {
	                Map<String, Object> newDeptData = new HashMap<>();
	                newDeptData.put("text", department);  // 부서 이름을 텍스트로 설정
	                newDeptData.put("children", new ArrayList<Map<String, Object>>());  // 자식 리스트 초기화
	                return newDeptData;
	            });

	            List<Map<String, Object>> children = (List<Map<String, Object>>) departmentData.get("children");

	            // 직위에 따라 정렬된 자식 노드 추가
	            Map<String, Object> employeeData = new HashMap<>();
	            employeeData.put("text", empName + " (" + posiName + ")");
	            employeeData.put("icon", "jstree-file");

	            // 자식 노드 추가
	            children.add(employeeData);
	        }

	        // 직위에 따라 자식 노드를 정렬
	        for (Map<String, Object> department : departmentMap.values()) {
	            List<Map<String, Object>> children = (List<Map<String, Object>>) department.get("children");
	            children.sort((a, b) -> {
	                // 직위에 따라 정렬 로직
	                String posiA = (String) a.get("text");
	                String posiB = (String) b.get("text");
	                return posiB.compareTo(posiA);
	            });
	        }

	        return new ArrayList<>(departmentMap.values());

	    }


	@GetMapping("annDetail.do")
	public String detail(@RequestParam String what, Model model) {
		PmsApprovalVO appro = formservice.detailAppro(what);
		System.out.print("ccccccccccccccccccccccccccccc" +what);
	 	model.addAttribute("appro", appro);

	 	System.out.print("aaaaaaaaaaaaaaaaaaaaaaaaa" +appro);
	 	return "pms/approvalbox/annualDetail";
	 }
	
	

	@GetMapping("annInDetail.do")
	public String Indetail(@RequestParam String what, Model model) {
		PmsApprovalVO appro = formservice.detailAppro(what);
		model.addAttribute("appro", appro);

		return "pms/approvalbox/annualInDetail";
	}


	@GetMapping("requestDetail.do")
	public String requestdetail(@RequestParam String what, Model model) {
		PmsApprovalVO appro = formservice.detailAppro(what);
		model.addAttribute("appro", appro);
		
		return "pms/approvalbox/requestDetail";
	}
	
	
//	@PostMapping("requestDetail.do")
//	public String requestpost(@RequestParam String what, Model model) {
//		PmsApprovalVO appro = formservice.detailAppro(what);
//		model.addAttribute("appro", appro);
//		
//		return "redirect:/approvalform.do";
//	}

	
	
// 양식 리스트
	@GetMapping("approvalform.do")
	public String mypage(Model model,
						@ModelAttribute("condition") SimpleCondition simpleCondition
						, Authentication authentication
						, HttpSession session) {
		PaginationInfo paging = new PaginationInfo(10,2);
		paging.setSimpleCondition(simpleCondition);

		EmpVO empvo = (EmpVO) session.getAttribute("empvo");
	    String empId = empvo.getEmpId();

	    simpleCondition.setEmpId(empId);

		List<PmsApprovalVO> requestList = formservice.requestboxList(paging);
		model.addAttribute("boxList", requestList);
		
		
		List<ApprovalFormVO> approvalformList = formservice.retrieveApprovalformList();
		model.addAttribute("approvalformList",approvalformList);
		
		
		return "tiles:approval/approvalform";
	}

	
	@GetMapping("loadForm.do")
	public String loadForm(@RequestParam String title, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
        EmpVO empvo = (EmpVO)session.getAttribute("empvo");
        System.out.println("empvo"+empvo);
        AttencanceVO attvo = formservice.retrieveAttencanceByEmpId(empvo.getEmpId());
        empvo.setAttencance(attvo);

        model.addAttribute("empvo", empvo);

		String fileName = formservice.getFileNameForTitle(title);
		System.out.println("bbbbbbbbbbbbbbbbbbbbb"+fileName);
		return "pms/approval/"+fileName;
	}


//	보관함 링크

	@GetMapping("completedbox.do")
		public String completebox(@RequestParam(required = false, defaultValue = "1") int page
				, @ModelAttribute("condition") SimpleCondition simpleCondition
				, Model model) {
		PaginationInfo paging = new PaginationInfo(10,2);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		List<PmsApprovalVO> completeList = formservice.selectCompletedApprovals(paging);

		model.addAttribute("completeList", completeList);
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		 return "pms/approvalbox/completedbox";
	}



	@GetMapping("requestbox.do")
	public String requestbox(@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model,  Authentication authentication
			, HttpSession session) {

		PaginationInfo paging = new PaginationInfo(10,2);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);


		EmpVO empvo = (EmpVO) session.getAttribute("empvo");
	    String empId = empvo.getEmpId();

	    simpleCondition.setEmpId(empId);

		List<PmsApprovalVO> requestList = formservice.requestboxList(paging);
		model.addAttribute("boxList", requestList);
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "pms/approvalbox/requestbox";
	}


	@GetMapping("inbox.do")
	public String inbox(@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model,  Authentication authentication
			, HttpSession session) {
		PaginationInfo paging = new PaginationInfo(10,2);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		EmpVO empvo = (EmpVO) session.getAttribute("empvo");
	    String empId = empvo.getEmpId();

	    simpleCondition.setEmpId(empId);
		simpleCondition.setBoxType("inbox");

		List<PmsApprovalVO> boxList = formservice.pmsapprovalboxList(paging);
		model.addAttribute("boxList", boxList);
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "pms/approvalbox/inbox";
	}


	@GetMapping("outbox.do")
	public String outbox(@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model,  Authentication authentication
			, HttpSession session) {

		PaginationInfo paging = new PaginationInfo(10,2);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		EmpVO empvo = (EmpVO) session.getAttribute("empvo");
	    String empId = empvo.getEmpId();
	    System.out.print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+ empId);

	    simpleCondition.setEmpId(empId);
		simpleCondition.setBoxType("outbox");

		List<PmsApprovalVO> boxList = formservice.pmsapprovalboxList(paging);
		model.addAttribute("boxList", boxList);
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "pms/approvalbox/outbox";
	}

	  
	@GetMapping("returnbox.do")
	public String returnbox(@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model) {
				PaginationInfo paging = new PaginationInfo(10,2);
				paging.setPage(page);
				paging.setSimpleCondition(simpleCondition);

				List<PmsApprovalVO> returnList = formservice.selectreturnApprovals(paging);

				model.addAttribute("returnList", returnList);
				PaginationRenderer renderer = new DefaultPaginationRenderer();
				String pagingHTML = renderer.renderPagination(paging);

				model.addAttribute("pagingHTML", pagingHTML);

		return "pms/approvalbox/returnbox";
	}


	@GetMapping("teambox.do")
	public String teambox() {
		return "pms/approvalbox/teambox";
	}
}
