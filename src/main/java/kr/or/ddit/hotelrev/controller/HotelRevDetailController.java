package kr.or.ddit.hotelrev.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hotelrev")
public class HotelRevDetailController {

	@GetMapping("/detail.do")
	public String retrieveDetail(Model model, @RequestParam("what") String htrevId) {

		return "";
	}

}
