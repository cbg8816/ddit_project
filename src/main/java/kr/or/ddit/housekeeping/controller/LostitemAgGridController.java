package kr.or.ddit.housekeeping.controller;

import java.io.WriteAbortedException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.SmartValidator;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.housekeeping.exception.WriterAuthenticationException;
import kr.or.ddit.housekeeping.service.lostitem.LostitemAgGridService;
import kr.or.ddit.vo.LostitemVO;

@RestController
@RequestMapping("/lostItem")
public class LostitemAgGridController {

	@Autowired
	private LostitemAgGridService service;

	@Autowired
	private SmartValidator validator;


	/**
	 * 전체 리스트 조회
	 * @return
	 */
	@GetMapping
	public List<LostitemVO> list(){
		return service.readLostitemList();
	}

	/**
	 * 상세조회
	 * @param hksNo
	 * @return
	 */
	@GetMapping("{hksNo}")
	public LostitemVO detail(@PathVariable int hksNo) {
		return service.readlostitem(hksNo);
	}

	/**
	 * 등록
	 * @param lostitem
	 * @param errors
	 * @return
	 */
	@PostMapping
	public Map<String, Object> insert(@RequestBody LostitemVO lostitem, BindingResult errors) {
		Map<String, Object> result = new HashMap<>();
		result.put("target", lostitem);
		validator.validate(lostitem, errors);
		if(errors.hasErrors()) {
			result.put("success", false);
			result.put("errors",
				errors.getFieldErrors().stream()
					.collect(Collectors.toMap(FieldError::getField, FieldError::getDefaultMessage))
			);
		}else {
			service.createLostitem(lostitem);
			result.put("success", true);
			result.put("target", service.readlostitem(lostitem.getHksNo()));
		}
		return result;
	}

	/**
	 * 수정
	 * @param lostitem
	 * @param errors
	 * @return
	 */
	@PutMapping("{hksNo}")
	public Map<String, Object> update(@RequestBody LostitemVO lostitem, BindingResult errors){
		Map<String, Object> result = new HashMap<>();
		result.put("targer", lostitem);
		validator.validate(lostitem, errors);
		if(errors.hasErrors()) {
			result.put("success", false);
			result.put("errors",
					errors.getFieldErrors().stream()
					.collect(Collectors.toMap(FieldError::getField, FieldError::getDefaultMessage)));
		}else {
			try {
				service.modifyLostitem(lostitem);
				result.put("success", true);
				result.put("target", service.readlostitem(lostitem.getHksNo()));
			}catch (WriterAuthenticationException e) {
				result.put("success", false);
				result.put("message", e.getMessage());
			}
		}
		return result;
	}

	/**
	 * 삭제
	 * @param lostitem
	 * @return
	 */
	@DeleteMapping("{hksNo}")
	public Map<String, Object> delete (@RequestBody LostitemVO lostitem){
		Map<String, Object> result = new HashMap<>();
		try {
			service.removelostitem(lostitem.getHksNo());
			result.put("success", true);
		} catch (WriterAuthenticationException e) {
			result.put("success", false);
			result.put("message", e.getMessage());
		}
		return result;
	}


}
