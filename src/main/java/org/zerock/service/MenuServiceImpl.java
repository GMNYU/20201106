package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.MenuVO;
import org.zerock.mapper.MenuMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service // 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용
@AllArgsConstructor
public class MenuServiceImpl  implements MenuService{

	// spring4.3이상에서 자동 처리
	private MenuMapper mapper;

	@Override
	public void register(MenuVO menu) {
		log.info("register......" + menu);
		
		mapper.insertSelectKey(menu);
	}	
	
	@Override
	public List<MenuVO> getList() {
		log.info("getList..........");
		
		return mapper.getList();
	}
	
	@Override
	public MenuVO get(Long mno) {
		log.info("get......"+mno);
		return mapper.read(mno);
	}

	@Override
	public boolean modify(MenuVO menu) {
		log.info("modify......" + menu);
		return mapper.update(menu)==1;
	}

	@Override
	public boolean remove(Long mno) {
		log.info("remove...."+mno);
		return mapper.delete(mno) == 1;
	}


}
