package kr.or.ddit.approval.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.approval.dao.ApprovalMapper;
import kr.or.ddit.approval.service.ApprovalFormService;
import kr.or.ddit.attencance.service.AttencanceService;
import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.vo.ApprovalFormVO;
import kr.or.ddit.vo.ApprovalLineVO;
import kr.or.ddit.vo.AttencanceDetailVO;
import kr.or.ddit.vo.AttencanceVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PmsApprovalVO;

@Controller
//@RequestMapping("/approval")
public class ApprovalUpdateController {
    @Autowired
    private ApprovalFormService service;

    @Autowired
    private ApprovalMapper mapper;

    @Autowired
	public AttencanceService attservice;

//	@ModelAttribute("pmsapproval")
//	public List<PmsApprovalVO> pmsapproval(Model model) {
//		return mapper.allList();
//	}



    @GetMapping("/approval/annual.do")
    public String showAnnualForm(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        EmpVO empvo = (EmpVO)session.getAttribute("empvo");
        AttencanceVO attvo = service.retrieveAttencanceByEmpId(empvo.getEmpId());
        empvo.setAttencance(attvo);

        model.addAttribute("empvo", empvo);

        return "pms/approval/annual";
    }

    @PostMapping("/approvalform.do")
    public String updateAnnual(@ModelAttribute("pmsapproval") PmsApprovalVO pmsapproval,
    							@ModelAttribute("attvo") AttencanceDetailVO attvo,
    							@ModelAttribute("line") ApprovalLineVO line,
                               Errors errors,
                               RedirectAttributes redirectAttributes) {

        if(errors.hasErrors()) {
            return "pms/approval/annual";
        } else {
        	service.annualcreate(pmsapproval);
        	service.linecreate(pmsapproval);
        	attservice.createattvo(attvo);
            return "redirect:/approvalform.do";
        }
	}
    






}
