package kr.or.ddit.paystub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.emp.dao.EmpMapper;
import kr.or.ddit.paystub.service.PaystubService;
import kr.or.ddit.specification.dao.SpecificationMapper;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PaystubVO;
import kr.or.ddit.vo.SpecificationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/paystub/paystubInsert.do")
public class PaystubInsertController {

	@Autowired
	private PaystubService service;

	@Autowired
	public EmpMapper empDAO;

	@Autowired
	public SpecificationMapper speDAO;

//	@Autowired
//	public PaystubMapper payDAO;

	@ModelAttribute("empList")
	public List<EmpVO> addAttributee(){
		return empDAO.selectEmpListBasic();
	}

	@ModelAttribute("speList")
	public List<SpecificationVO> addAttributes(){
		return speDAO.selectSpecificationList();
	}

//	@ModelAttribute("payList")
//	public List<PaystubVO> addAttributep(){
//		return payDAO.selectPaystubListBasic();
//	}


	@ModelAttribute("paystub")
	public PaystubVO paystub() {
		return new PaystubVO();
	}

	@GetMapping
	public String formUI() {

		return "tiles:paystub/paystubInsert";
	}

	@ResponseBody
	@PostMapping
	public String formDataProcess(
		@RequestBody List<PaystubVO> paystubList
	) {

//		log.info("qqqqqqqq : {}",paystubList);
//		log.info("pppppppp : {}",paystubList.size());

//		for(PaystubVO single : paystubList) {
//			log.info("plz : {}", single);
//		}

		String res = "fail";


		if(paystubList.size()!=0) {
			res = "ok";
			service.createPaystubList(paystubList);
		}

		return res;
	}

//	@PostMapping
//	public String formDataProcess(
//		@Validated @ModelAttribute("paystub") PaystubVO paystub
//		, Errors errors
//		, RedirectAttributes redirectAttributes
//	) {
//		redirectAttributes.addFlashAttribute("paystub", paystub);
//
//		if(!errors.hasErrors()) {
//			redirectAttributes.addFlashAttribute("redirect", "redirect");
//			for (PaystubVO paystub1 : list) {
//				service.createPaystub(paystub1);
//			}
//			return "redirect:/paystub/paystubList.do";
//		}else {
//			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "paystub", errors);
//			return "redirect:/paystub/paystubInsert.do";
//		}
//	}

//	@GetMapping
//	public String formDataProcess(
//			@ModelAttribute("paystub") PaystubVO paystub
//			) {
//		System.out.println("입력됨" +  paystub.getPaystubTotal());
//
//		return "test";
//	}
}
