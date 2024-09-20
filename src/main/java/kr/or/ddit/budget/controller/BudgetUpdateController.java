package kr.or.ddit.budget.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BudgetUpdateController {

	@GetMapping("/budgetUpdate.do")
	public String budgetUpdateController() {

		return "tiles:budget/budgetUpdate";
	}

}
