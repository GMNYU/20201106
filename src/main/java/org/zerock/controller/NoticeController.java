package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeAttachVO;
import org.zerock.domain.NoticeVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//DB와 연동되는 페이지들 중, 공지사항 페이지입니다.
//log.info는 모두 확인용.

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {
	private NoticeService service;
	
	@GetMapping("/list")//공지사항의 첫 페이지입니다.
	public void list(Criteria cri, Model model) {
		log.info("...list..." + cri);
	
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	@PostMapping("/register") //게시물 추가
	@PreAuthorize("isAuthenticated()")
	public String register(NoticeVO notice, RedirectAttributes rttr) {
		log.info("================================");
		log.info("register: " + notice);
		if(notice.getAttachList() != null) {
			notice.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("================================");
		service.register(notice);
		rttr.addFlashAttribute("result", notice.getBno());
		return "redirect:/notice/list";
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
	}
	
	
	@GetMapping({"/read","/modify"})//게시물 확인
	public void read(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/read or /modify");
		model.addAttribute("notice", service.read(bno));
	}
	
	
	@PostMapping("/modify")
	@PreAuthorize("principal.username == #writer")
	public String modify(NoticeVO notice, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr, String writer) {
		log.info("modify: " + notice); 
		if(service.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/notice/list" + cri.getListLink();
	}
	
	@PostMapping("/remove") // 게시물 삭제
	@PreAuthorize("principal.username == #writer")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String writer) {
		log.info("remove..." + bno);
		List<NoticeAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)) {
			// delete attach files
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/notice/list" + cri.getListLink();
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<NoticeAttachVO>> getAttachList(Long bno) {
		log.info("getAttachList " + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	private void deleteFiles(List<NoticeAttachVO> attachList) {
	    if(attachList == null || attachList.size() == 0) {
	      return;
	    }
	    
	    log.info("delete attach files...................");
	    log.info(attachList);
	    
	    attachList.forEach(attach -> {
	      try {        
	        Path file  = Paths.get("D:\\zzz\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
	        Files.deleteIfExists(file);
	        if(Files.probeContentType(file).startsWith("image")) {
	          Path thumbNail = Paths.get("D:\\zzz\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
	          Files.delete(thumbNail);
	        }
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }//end catch
	    });//end foreachd
	}
}
