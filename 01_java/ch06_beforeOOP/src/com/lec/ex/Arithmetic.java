package com.lec.ex;

public class Arithmetic {
	//1��¥�� sum
	public int sum(int to) {
		//�� �޼ҵ��� ������. �Ű����� �ϳ��� ������ ����, �ΰ��� ������ �Ʒ��� �����Ѵ�.
		int result = 0;
		for (int i = 1; i <= to; i++) {
			result = result + i; // result +=i;
		}
		return result;
	}
	//2��¥�� sum
	public int sum(int from, int to) {
		int result = 0;
		for (int i = from; i <= to; i++) {
			result = result + i; // result +=i;
		}
		return result;
		//return�� ������ �������� ���ư��� ������ �� �Ʒ��� �ڵ忡�� ������ �� ����. 
		//return ������ �޼ҵ� ������ �������� ���ư��µ� ���� �Ȱ�������. �̷� ��� static �ڸ� void�� ħ(�� �ڸ��� ��� ���ư� ���� ���� �̾߱���)
	}
	//¦Ȧ�Ǻ�
	public String evenOdd(int value) {
		String result = value % 2 == 0 ? "¦���Դϴ�" : "Ȧ���Դϴ�";
		return result;
	}
	
	public static int abs(int value) {
		// int result = (value >=0)? value ; -value;
		int result;
		if(value>=0) {
			result=value;
		}else {
			result=-value;
		}
		return result;
	}
}
