package kr.or.ddit.emp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.department.dao.DepartmentMapper;
import kr.or.ddit.emp.dao.EmpMapper;
import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.position.dao.PositionMapper;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PositionVO;

@Controller
@RequestMapping("emp/empUpdate.do")
public class EmpUpdateController {
	@Autowired
	public EmpService service;

	@Autowired
	public PositionMapper posiDAO;

	@Autowired
	public DepartmentMapper deptDAO;

	@ModelAttribute("posiList")
	public List<PositionVO> addAttributeP(){
		return posiDAO.selectPositionList();
	}

	@ModelAttribute("deptList")
	public List<DepartmentVO> addAttributeD(){
		return deptDAO.selectDepartmentList();
	}

	@GetMapping
	public String formUI(Model model, @RequestParam String what) {
		if(!model.containsAttribute("emp")) {
			EmpVO emp = service.retrieveEmp(what);
			model.addAttribute("emp", emp);
		}
		return "tiles:emp/empUpdate";
	}

	@PostMapping
	public String formDataProcess(
		@ModelAttribute("emp") EmpVO emp
		, Errors errors
		, RedirectAttributes redirectAttributes
	) {

		redirectAttributes.addFlashAttribute("emp", emp);

		if(errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "emp", errors);
			return "redirect:/emp/empUpdate.do?what=" + emp.getEmpId();
		}else {
			service.modifyEmp(emp);
			return "redirect:/emp/empList.do";
		}
	}
}
