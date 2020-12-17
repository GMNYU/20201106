package org.zerock.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MenuBoardVO;
import org.zerock.mapper.MenuBoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MenuBoardServiceImpl implements MenuBoardService{
	@Setter(onMethod_ = @Autowired)
	private MenuBoardMapper mbMapper;

	@Override
	public void register(MenuBoardVO mbBoardVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(MenuBoardVO mbBoardVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(String menuName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MenuBoardVO> getList() {
		log.info("...getList at Impl...");
		return mbMapper.getList();
	}
}

