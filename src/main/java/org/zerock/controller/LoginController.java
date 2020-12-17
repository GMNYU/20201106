package org.zerock.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/login/*")
public class LoginController {
	
	@GetMapping("/log")
	public void log() {
		log.info("...log...");
	}
	@PostMapping("/log")
	public void log(String error, String logout, Model model) {
		
			log.info("error: " + error);
			log.info("logout: " + logout);
			
			if (error != null) {
				model.addAttribute("error", "Login Error Check Your Account");
			}
			
			if (logout != null) {
				model.addAttribute("logout","Logout!!");
			}
	}
	@GetMapping("/log2")
	public void log2() {
		log.info("...log2...");
	}
	@PostMapping("/log2")
	public void log2(String error, String logout, Model model) {
		
			log.info("error: " + error);
			log.info("logout: " + logout);
			
			if (error != null) {
				model.addAttribute("error", "Login Error Check Your Account");
			}
			
			if (logout != null) {
				model.addAttribute("logout","Logout!!");
			}
	}
	@GetMapping("/signup")
	public void signup() {
		log.info("...signup...");
	}
	
	@GetMapping("/member")
	public void member() {
		log.info("...member...");
	}
	
	@PostMapping("/member")
	public String member(MemberVO member, RedirectAttributes rttr) {
		log.info("===================");
		log.info("member: " + member);
		
		if (member.getAuthList() != null) {
			member.getAuthList().forEach(attach -> log.info(attach));
		}
		return "redirect:/main";
	}
	
	
	@GetMapping("/admin")
	public void admin() {
		log.info("...admin...");
	}
	@GetMapping("/all")
	public void all() {
		log.info("...all...");
	}
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access denied : " + auth);
		model.addAttribute("msg", "Access Denied");
	}
	
	/*
	 * @GetMapping("/customLogin") public void loginInput(String error, String
	 * logout, Model model) {
	 * 
	 * log.info("error: " + error); log.info("logout: " + logout);
	 * 
	 * if (error != null) { model.addAttribute("error",
	 * "Login Error Check Your Account"); }
	 * 
	 * if (logout != null) { model.addAttribute("logout","Logout!!"); } }
	 */	
	  @GetMapping("/customLogout") 
	  public void logoutGET() {
	  
	  log.info("custom logout"); 
	  }	
}
