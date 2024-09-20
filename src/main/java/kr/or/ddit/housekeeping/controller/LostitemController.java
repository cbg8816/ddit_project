package kr.or.ddit.housekeeping.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.housekeeping.service.lostitem.LostitemService;
import kr.or.ddit.vo.LostitemVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/lostitem")
public class LostitemController {

	@Autowired
	private LostitemService service;

	/**
	 * 페이징 처리 리스트
	 * @param page
	 * @param simpleCondition
	 * @param model
	 * @return
	 */
	@GetMapping("/lostitemList.do")
	public String list(@RequestParam(required = false ,defaultValue = "1") int page
							, @ModelAttribute("condition") SimpleCondition simpleCondition
							, Model model) {

		PaginationInfo paging = new PaginationInfo();
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		List<LostitemVO> lostitemList = service.readLostitemList(paging);
		model.addAttribute("lostitemList", lostitemList);

		int LostitemIncompletecount = service.LostitemIncompletecount();
		model.addAttribute("LostitemIncompletecount", LostitemIncompletecount);

		int Lostitemcompletecount = service.Lostitemcompletecount();
		model.addAttribute("Lostitemcompletecount", Lostitemcompletecount);
		
		
		PaginationRenderer rederer = new DefaultPaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:lostitem/lostitemList";

	}

	/**
	 * 상세보기
	 * @param hksNo
	 * @return
	 */
	@GetMapping("/lostitemDetail.do")
	@ResponseBody   // JSON으로 쓰려면 필요한 부분
	public LostitemVO detail(@RequestParam("what") String hksNo) {
		LostitemVO lostitem = service.readLostitem(Integer.parseInt(hksNo));
		return lostitem;
	}


	@GetMapping
	public String formUI () {
		return "tiles:lostitem/lostitemList";
	}


	@PostMapping("/lostitemInsert.do")
	public String insertBroken (@ModelAttribute("lostitem")LostitemVO lostitem
			, Errors errors
			, RedirectAttributes redirectAttributes ) {
		List<ObjectError> errorList = errors.getAllErrors();
		for (ObjectError objectError : errorList) {
			log.info("formDataProcess errors : {}", objectError.getCode() );
			log.info("formDataProcess errors : {}", objectError.getObjectName());
			log.info("formDataProcess errors : {}", objectError.getDefaultMessage());
		}

		String lvn = "";

		if(errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn = "redirect:/lostitem/lostitemInsert.do?what="+lostitem.getHksNo();
			return lvn;
		}else {
			service.createLostitem(lostitem);
			return  "redirect:/lostitem/lostitemList.do?what="+lostitem.getHksNo();

		}
    }

	@PostMapping("/lostitemUpdate.do")
	public String updateBrokenroom(@ModelAttribute("lostitem")LostitemVO lostitem
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
			lvn="redirect:/lostitem/lostitemUpdate.do?what="+lostitem.getHksNo();
		}else {
			service.modifyLostitem(lostitem);
			lvn ="redirect:/lostitem/lostitemList.do";
		}

	return lvn;
	}

	@GetMapping("/lostitemIncompleteList.do")
	public String LostitemIncompleteList(@RequestParam(required = false ,defaultValue = "1") int page
							, @ModelAttribute("condition") SimpleCondition simpleCondition
							, Model model) {

		PaginationInfo paging = new PaginationInfo();
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		List<LostitemVO> LostitemIncompleteList = service.LostitemIncompleteList(paging);
		model.addAttribute("LostitemIncompleteList", LostitemIncompleteList);

		int LostitemIncompletecount = service.LostitemIncompletecount();
		model.addAttribute("LostitemIncompletecount", LostitemIncompletecount);

		int Lostitemcompletecount = service.Lostitemcompletecount();
		model.addAttribute("Lostitemcompletecount", Lostitemcompletecount);
		
		
		DefaultPaginationRenderer rederer = new DefaultPaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:lostitem/lostitemIncompleteList";
	}
	
	@GetMapping("/lostitemCompleteList.do")
	public String LostitemCompleteList(@RequestParam(required = false ,defaultValue = "1") int page
							, @ModelAttribute("condition") SimpleCondition simpleCondition
							, Model model) {

		PaginationInfo paging = new PaginationInfo();
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		List<LostitemVO> LostitemCompleteList = service.LostitemCompleteList(paging);
		model.addAttribute("LostitemCompleteList", LostitemCompleteList);

		int LostitemIncompletecount = service.LostitemIncompletecount();
		model.addAttribute("LostitemIncompletecount", LostitemIncompletecount);

		int Lostitemcompletecount = service.Lostitemcompletecount();
		model.addAttribute("Lostitemcompletecount", Lostitemcompletecount);
		
		
		DefaultPaginationRenderer rederer = new DefaultPaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:lostitem/lostitemCompleteList";
	}


}
