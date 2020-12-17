package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.NoticeAttachVO;
import org.zerock.domain.NoticeVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.NoticeAttachMapper;
import org.zerock.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	// spring 4.3이상에서 자동 처리 -> 생성자가 만들어짐
	//private BoardMapper mapper;
	@Setter(onMethod_ = {@Autowired})
	private NoticeMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private NoticeAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(NoticeVO notice) {
		log.info("register..." + notice);
		mapper.insertSelectKey(notice);
		if(notice.getAttachList() == null || notice.getAttachList().size() <= 0) {
			return;
		}
		notice.getAttachList().forEach(attach -> {
			attach.setBno(notice.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public NoticeVO read(Long bno) {
		log.info("get..." + bno);
		return mapper.read(bno);
	}

	@Transactional
	@Override
	public boolean modify(NoticeVO notice) {
		log.info("modify..." + notice);
		attachMapper.deleteAll(notice.getBno());
		boolean modifyResult = mapper.update(notice) == 1;
		if(modifyResult && notice.getAttachList() != null && notice.getAttachList().size() > 0) {
			notice.getAttachList().forEach(attach -> {
				attach.setBno(notice.getBno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long bno) {
		log.info("remove..." + bno);
		attachMapper.deleteAll(bno);
		return mapper.delete(bno) == 1;
	}
	

	@Override
	public List<NoticeVO> getList(Criteria cri) {
		log.info("get List with Criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<NoticeAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno " + bno);
		return attachMapper.findByBno(bno);
	}
}