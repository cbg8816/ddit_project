package kr.or.ddit.budget.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/budget")
public class BudgetController {

	@GetMapping("/budgetList.do")
	public String budgetRetrieveController() {

		return "tiles:budget/budgetList";
	}

	@PostMapping("/budgetList.do")
	public String budgetChart() {

		return "pms/budget/budgetList";
	}

}
