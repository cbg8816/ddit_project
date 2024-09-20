package kr.or.ddit.empmypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	@GetMapping("empmypage.do")
	public String mypage() {
		
		return "miles:empmypage";
	}
}
