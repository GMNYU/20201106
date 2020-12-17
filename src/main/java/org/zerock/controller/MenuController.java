package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MenuVO;
import org.zerock.service.MenuService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/menu/*")
@AllArgsConstructor
public class MenuController {
	
	private MenuService service;
	@GetMapping("/a1")
	public void a1(Model model) {
		log.info("...a1...");
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping("/register")
	public String register(MenuVO menu, RedirectAttributes rttr) {
	
		log.info("register: " + menu);
		service.register(menu);
		rttr.addFlashAttribute("result",menu.getMno());
		return "redirect:/menu/a1";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("mno") Long mno, Model model) {
		log.info("/get");
		model.addAttribute("menu",service.get(mno));
	}
	
	@PostMapping("/modify")
	public String modify(MenuVO menu, RedirectAttributes rttr) {
		log.info("modify:" +menu);
		if(service.modify(menu)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/menu/a1";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("mno") Long mno, RedirectAttributes rttr){
		log.info("remove..." + mno);
		if (service.remove(mno)) {
		rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/menu/a1";
	}
	@GetMapping("/beverage")
	public void beverage() {
		log.info("...beverage...");
	}
	@GetMapping("/food")
	public void food() {
		log.info("...food...");
	}
	@GetMapping("/roast")
	public void roast() {
		log.info("...roast...");
	}
	@GetMapping("/md")
	public void md() {
		log.info("...md...");
	}


}
