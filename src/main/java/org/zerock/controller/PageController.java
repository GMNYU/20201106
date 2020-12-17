package org.zerock.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//DB와 관계없는 페이지는 여기서 호출 하도록했습니다.
//log.info는 모두 확인용.
@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class PageController {
	@GetMapping("/main")
	@PreAuthorize("isAuthenticated()")
	public void home() {
		log.info("...main...");
	}
	
	@PostMapping("/main")
	@PreAuthorize("isAuthenticated()")
	public String main(MemberVO member, RedirectAttributes rttr) {
		log.info(".....main.....");
		return "redirect:/main";
	}
	
	
	@GetMapping("/menu")
	public void menu() {
		log.info("...menu...");
	}
	
	@GetMapping("/inpo")
	public void inpo() {
		log.info("...inpo...");
	}
	
	@GetMapping("/service")
	public void service() {
		log.info("...service...");
	}

		
}
