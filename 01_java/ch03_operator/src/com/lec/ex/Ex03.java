package com.lec.ex;
// ���迬����(�񱳿�����) : ������?(==) �ٸ���?(!=) ū��?(>) ������?(<) ũ�ų� ������?(>=)
public class Ex03 {
	public static void main(String[] args) {
		int n1=10, n2=5;
		boolean result = n1 > n2;
		// �񱳿������� ��������� �����ϱ� �����ʸ��� ���ǰ� ���ʰ������ �Ѿ
		System.out.printf("%d %s %d = %b\n", n1, ">", n2, result);
		//%b�� �Ҹ�!
		result = n1 >= n2;
		System.out.printf("%d %s %d = %b\n", n1, ">=", n2, result);
		result = n1 == n2;
		System.out.printf("%d %s %d = %b\n", n1, "==", n2, result);
		result = n1 != n2;
		System.out.printf("%d %s %d = %b\n", n1,"!=",n2,result);
	}

}
