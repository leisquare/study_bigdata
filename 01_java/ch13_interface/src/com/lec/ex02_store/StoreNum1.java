package com.lec.ex02_store;

// 주택가에 매장1호점: 김치찌개-5,000  부대찌개-5,000  비빔밥-6,000 순대국-안팔아 공기밥-1,000원
public class StoreNum1 implements HeadQuarterStore {
//클래스에 마우스대고 컨트롤 1.

	private String name;

	public StoreNum1(String name) {
		this.name = name;
	}

//extends->implements로 변경, name변수 추가, 생성자 수정, getter추가
	@Override
	public void kimchi() {
		System.out.println("김치찌개 4500원");
	}

	@Override
	public void bude() {
		System.out.println("부대찌개 5000원");
	}

	@Override
	public void bibim() {
		System.out.println("부대찌개 5000원");
	}

	@Override
	public void sundae() {
		System.out.println("순대국 안팔아");
	}

	@Override
	public void bab() {
		System.out.println("공기밥 1000원");
	}

	public String getName() {
		return name;
	}

}
