package kr.or.ddit.buyer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.buyer.service.BuyerService;
import kr.or.ddit.lprod.dao.LprodMapper;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;

@Controller
@RequestMapping("/buyer/buyerInsert.do")
public class BuyerInsertController{
	@Autowired
	private BuyerService service;
	@Autowired
	private LprodMapper lprodDAO;
	
	@ModelAttribute("lprodList")
	public List<LprodVO> addAttribute(Model model) {
		return lprodDAO.selectLprodList();
	}
	
	@ModelAttribute("buyer")
	public BuyerVO buyer() {
		return new BuyerVO();
	}
	
	@GetMapping
	public String formUI(){
		return "tiles:buyer/buyerInsert";
	}
	
	@PostMapping
	public String formDataProcess(
		@Validated(InsertGroup.class) @ModelAttribute("buyer") BuyerVO buyer
		, BindingResult errors
		, RedirectAttributes redirectAttributes
	){
//		1. 모든 파라미터를 command object 에 바인드함.
//		2. command object 를 대상으로 검증 수행
//		3. 검증 통과시
		String logicalViewName = null;
		redirectAttributes.addFlashAttribute("buyer",buyer);
		if(!errors.hasErrors()) {
			redirectAttributes.addFlashAttribute("redirect","redirect");
//			- 로직 실행
			service.createBuyer(buyer);
//			- 새로 등록된 제조사의 상세 페이지로 뷰를 결정
//			logicalViewName = "redirect:/buyer/buyerDetail.do?what=" + buyer.getBuyerId();
			logicalViewName = "redirect:/buyer/buyerList.do";
		}else {
//		4. 검증 실패시
//			- 다시 정상 데이터를 입력할 수 있는  UI 페이지로 뷰를 결정(기존 데이터, 검증 결과 데이터 전달).
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"buyer", errors);
			logicalViewName = "redirect:/buyer/buyerInsert.do";
		}
//		5. 뷰 레이어로 이동
		return logicalViewName;
	}
	
	  @GetMapping("/getDummyData")
	    @ResponseBody
	    public BuyerVO getDummyData() {
	        BuyerVO buyer = new BuyerVO();
	        buyer.setBuyerLgu("P101");
	        buyer.setBuyerName("테스트거래처");
	        buyer.setBuyerComtel("010-1234-5678");
	        buyer.setBuyerFax("02-9876-5432");
	        buyer.setBuyerMail("dummy@example.com");
	        buyer.setBuyerCharger("Charger");
	        buyer.setBuyerBank("Dummy Bank");
	        buyer.setBuyerBankno("123-456-789");
	        buyer.setBuyerBankname("Dummy Bank");
	        buyer.setBuyerZip("12345");
	        buyer.setBuyerAdd1("Dummy Address 1");
	        buyer.setBuyerAdd2("Dummy Address 2");

	        return buyer;
	    }
}

