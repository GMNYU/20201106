package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.MenuBoardVO;

public interface MenuBoardMapper {
	//@Select("select * from tbl_menu")
	public void insert(MenuBoardVO menuBoard);
	//public void insertSelectKey(MenuBoardVO menuBoard);
	public MenuBoardVO read(String menuName);
	public int delete(String menuName);
	public List<MenuBoardVO> getList();
	public int update(MenuBoardVO menuBoard);
}
