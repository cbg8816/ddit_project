package kr.or.ddit.party.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.party.service.PartyserviceService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.PartyserviceVO;


@Controller
@RequestMapping("/Partyservice/partyupdate.do")
public class PartyserviceupdateController {

	@Autowired
	private PartyserviceService service;

	@GetMapping
	public String formUI(@RequestParam String what, Model model){
		PartyserviceVO party = service.readPartyservice(what);
		model.addAttribute("party", party);
		return "tiles:partyservice/partyupdate";
	}

	@PostMapping
	public String formDataProcess(
		@Validated(UpdateGroup.class) @ModelAttribute("party") PartyserviceVO party
		, Errors errors, RedirectAttributes redirectAttributes
	){
		String lvn = "";

		if (errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn = "redirect:/Partyservice/partyupdate.do?what=" + party.getPartyNo();
		} else {
			service.modifyPartyservice(party);
			lvn = "redirect:/Partyservice/partyList.do";
		}
		return lvn;
	}
}
