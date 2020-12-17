package org.zerock.domain;

import lombok.Data;

@Data // lombok을 이용해서 생성자와 get/setter,toString()등을 만들어내는 방식 사용
public class MenuVO {
	private long mno;
	private String menuName;
	private String mainCategory;
	private String subCategory;
	private String menuTbn;
}