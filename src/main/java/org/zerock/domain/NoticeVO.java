package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NoticeVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
	
	private int replyCnt;
	
	private List<NoticeAttachVO> attachList;
}