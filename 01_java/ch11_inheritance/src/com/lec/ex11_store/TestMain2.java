package com.lec.ex11_store;

public class TestMain2 {
	public static void main(String[] args) {
		HeadQuarterStore[] store = { new HeadQuarterStore("본사"), new StoreNum1("주택가 1호점"), new StoreNum2("대학가 2호점"),
				new StoreNum3("증권가 3호점") };
		for (HeadQuarterStore s : store) {
			System.out.println(s.getName());
			s.kimchi();
			s.bude();
			s.bibim();
			s.sundae();
			s.bab();
		}
		System.out.println("=============================");
		for (int idx = 0; idx < store.length; idx++) {
			System.out.println(store[idx].getName());
			store[idx].kimchi();
			store[idx].bude();
			store[idx].bibim();
			store[idx].sundae();
			store[idx].bab();

		}
	}
}
