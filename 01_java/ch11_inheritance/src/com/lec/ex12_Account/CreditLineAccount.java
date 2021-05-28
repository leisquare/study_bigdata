package com.lec.ex12_Account;

public class CreditLineAccount extends CheckingAccount{
	private long creditLine;
	public CreditLineAccount(String accountNo, String ownerName, String cardNo, int creditLine) {
		super(accountNo, ownerName, cardNo);
		this.creditLine=creditLine;
	}
	public CreditLineAccount(String accountNo, String ownerName, int balance, String cardNo, int creditLine) {
		super(accountNo, ownerName, balance, cardNo);
		this.creditLine=creditLine;
	}
	@Override
	public void pay (String cardNo, int price) {
		if(getCardNo().equals(cardNo)) {
			if(creditLine< price) {
				System.out.println(getOwnerName()+"님, 한도초과입니다. 떽끼");
			} else {
				creditLine -= price;
				System.out.println(getOwnerName()+"님, "+ price +"원 출금(잔여 한도액: "+creditLine+"원)");
			}
		} else {
			System.out.println("카드번호가 일치하지않습니다");
		}
	}
	@Override
	public void PrintAccount() {
		super.PrintAccount();
		System.out.println("카드 한도액 :" +creditLine);
	}
	public long getCreditLine() {return creditLine;}

}