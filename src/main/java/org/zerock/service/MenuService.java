package org.zerock.service;

import java.util.List;

import org.zerock.domain.MenuVO;

public interface MenuService {

	public void register(MenuVO menu);
	
	public MenuVO get(Long mno);
	
	public boolean modify(MenuVO menu);
	
	public boolean remove(Long mno);
	
	public List<MenuVO> getList();
}
