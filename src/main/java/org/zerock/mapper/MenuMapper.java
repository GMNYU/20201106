package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.MenuVO;

// Mapper인터페이스를 작성할 때는 리스트와 등록작업을 우선해서 작성
public interface MenuMapper {
	
	// @Select("select * from tbl_menu where mno > 0") xml에 sql문이 처리됨
	public List<MenuVO> getList();
	
	// insert만 처리되고 생성된 pk값을 알 필요가 없는 경우
	public void insert(MenuVO menu);
	
	// insert문이 실행되고 생성된 pk값을 알아야 하는 경우
	public void insertSelectKey(MenuVO menu);
	
	public MenuVO read(long bno);
	
	public int delete(long bno);
	
	public int update(MenuVO menu);
}
