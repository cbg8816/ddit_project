package kr.or.ddit.housekeeping.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.apache.tiles.jsp.taglib.AddAttributeTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.SmartValidator;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.housekeeping.dao.RentalMapper;
import kr.or.ddit.housekeeping.dao.RentalprodMapper;
import kr.or.ddit.housekeeping.exception.WriterAuthenticationException;
import kr.or.ddit.housekeeping.service.rental.RentalService;
import kr.or.ddit.vo.BrokenRoomVO;
import kr.or.ddit.vo.RentalVO;
import kr.or.ddit.vo.def.RentalprodVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/rental")
public class RentalController {

	@Autowired
	private RentalService service;

	@Autowired
	private RentalprodMapper rentalprod;

	/**
	 * 전체 리스트 조회 (페이징)
	 * @return
	 */
	@GetMapping("/rentalList.do")
	public String list(@RequestParam(required = false ,defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model){
		PaginationInfo paging = new PaginationInfo();
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		List<RentalVO> rentalList = service.readRentalList(paging);
		model.addAttribute("rentalList", rentalList);

		int RetalIncompletecount = service.RetalIncompletecount();
		model.addAttribute("RetalIncompletecount", RetalIncompletecount);

		int Retalcompletecount = service.Retalcompletecount();
		model.addAttribute("Retalcompletecount", Retalcompletecount);

		PaginationRenderer rederer = new DefaultPaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:rental/rentalList";
	}


	@ModelAttribute("renprodList")
	private List<RentalprodVO> rentalprod (Model model){
		return rentalprod.rentalProdList();
	}


	/**
	 * 상세조회
	 * @param hkrNo
	 * @return
	 */
	@GetMapping("/rentalDetail.do")
	public RentalVO detail(@RequestParam("what") String hkrNo) {
		RentalVO rental = service.readRental(Integer.parseInt(hkrNo));
		return rental;
	}

	@GetMapping
	public String formUI () {
		return "tiles:rental/rentalList";
	}

	/**
	 * 렌탈 등록
	 * @param rental
	 * @param bindingResult
	 * @return
	 */
	@PostMapping("/rentalInsert.do")
    public ResponseEntity<?> formDataProcess(
            @Valid @ModelAttribute("rental") RentalVO rental,
            BindingResult bindingResult) {

		// 검증 오류 처리
        if (bindingResult.hasErrors()) {
            // Validation errors, return error messages
            return ResponseEntity.badRequest().body(
                Collections.singletonMap("errorMessage", "Validation failed.")
            );
        }

        try {
            // 서비스 호출
            service.createRental(rental);

            // 성공 메시지 반환
            return ResponseEntity.ok().body(
                Collections.singletonMap("successMessage", "Broken successfully created!")
            );
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
                Collections.singletonMap("errorMessage", "Failed to create room.")
            );
        }
    }

	/**
	 * 렌탈 업데이틀
	 * @param rental
	 * @param errors
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping("/rentalUpdate.do")
	public String updateRental(@ModelAttribute("rental") RentalVO rental
			, Errors errors
			, RedirectAttributes redirectAttributes ) {
		List<ObjectError> errorList = errors.getAllErrors();
		for (ObjectError objectError : errorList) {
			log.info("formDataProcess errors : {}", objectError.getCode() );
			log.info("formDataProcess errors : {}", objectError.getObjectName());
			log.info("formDataProcess errors : {}", objectError.getDefaultMessage());
		}

		String lvn ="";

		if(errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn="redirect:/rental/rentalUpdate.do?what="+rental.getHkrNo();
		}else {
			service.modifyRental(rental);
			lvn ="redirect:/rental/rentalList.do";
		}

	return lvn;
	}

	@PostMapping("/rentalUpdatefinish.do")
	@ResponseBody
	public String updateYn (@RequestBody RentalVO rental
			, Errors errors
			, RedirectAttributes redirectAttributes ) {
		List<ObjectError> errorList = errors.getAllErrors();

		for (ObjectError objectError : errorList) {
			log.info("formDataProcess errors : {}", objectError.getCode() );
			log.info("formDataProcess errors : {}", objectError.getObjectName());
			log.info("formDataProcess errors : {}", objectError.getDefaultMessage());
		}

		String lvn ="";

		if(errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn="redirect:/rental/rentalUpdatefinish.do?what="+rental.getHkrNo();
		}else {
			service.modifyRentalfinish(rental);
			lvn ="redirect:/rental/rentalList.do";
		}

		return lvn;
	}

	@GetMapping("retalIncompleteList.do")
	public String RetalIncompleteList(@RequestParam(required = false ,defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model){
		PaginationInfo paging = new PaginationInfo();
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		List<RentalVO> RetalIncompleteList = service.RetalIncompleteList(paging);
		model.addAttribute("RetalIncompleteList", RetalIncompleteList);

		int RetalIncompletecount = service.RetalIncompletecount();
		model.addAttribute("RetalIncompletecount", RetalIncompletecount);

		int Retalcompletecount = service.Retalcompletecount();
		model.addAttribute("Retalcompletecount", Retalcompletecount);

		DefaultPaginationRenderer rederer = new DefaultPaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:rental/retalIncompleteList";
	}

	@GetMapping("retalCompleteList.do")
	public String RetalCompleteList(@RequestParam(required = false ,defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model){
		PaginationInfo paging = new PaginationInfo();
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		List<RentalVO> RetalCompleteList = service.RetalCompleteList(paging);
		model.addAttribute("RetalCompleteList", RetalCompleteList);

		int RetalIncompletecount = service.RetalIncompletecount();
		model.addAttribute("RetalIncompletecount", RetalIncompletecount);

		int Retalcompletecount = service.Retalcompletecount();
		model.addAttribute("Retalcompletecount", Retalcompletecount);

		DefaultPaginationRenderer rederer = new DefaultPaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:rental/retalCompleteList";
	}

}
