package kr.or.ddit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebIndexController {
	@RequestMapping("/web/home.do")
	public String index() {
		return "Web";
	}
}
