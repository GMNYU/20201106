package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//DB와 연동되는 페이지들 중, 이벤트 페이지입니다.
//log.info는 모두 확인용.
/*
 * 끔찍하게 비효율적인것을 아나, 
 * url을 통해 가져오는 DB를 바꿔서 쓰고있기에 
 * 전반적인 화면은 비슷하나 url을 따로 씁니다.
*/
@Controller
@Log4j
@RequestMapping("/event/*")
@AllArgsConstructor
public class EventController {
	@GetMapping("/event")//이벤트의 첫 페이지입니다.
	//공지사항과는 다르게, 첫번째 파일이 썸네일로 들어가야 합니다.
	public void eventList() {
		log.info("...eventList...");
	}
	
	@GetMapping("/eventPost")//게시물 확인
	public void eventPost() {
		log.info("...eventPost...");
	}
	
	@GetMapping("/eventModify")//게시물 수정
	public void eventModify() {
		log.info("...eventModify...");
	}
	
	@GetMapping("/eventRegister")//게시물 추가
	public void eventRegister() {
		log.info("...eventRegister...");
	}
	@GetMapping("/notice")//게시물 추가
	public void enotice() {
		log.info("...notice...");
	}
	
}
