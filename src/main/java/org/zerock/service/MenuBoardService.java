package org.zerock.service;

import java.util.List;

import org.zerock.domain.MenuBoardVO;

public interface MenuBoardService {
	
	public void register(MenuBoardVO mbBoardVO);
	
	public void modify(MenuBoardVO mbBoardVO);
	
	public void remove(String menuName);
	
	public List<MenuBoardVO> getList();
}
