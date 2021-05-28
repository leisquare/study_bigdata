package com.lec.ex;

public class Ex02 {

	private static int sum(int to) {
		//�� �޼ҵ��� ������. �Ű����� �ϳ��� ������ ����, �ΰ��� ������ �Ʒ��� �����Ѵ�.
		int result = 0;
		for (int i = 1; i <= to; i++) {
			result = result + i; // result +=i;
		}
		return result;
	}
	
	private static int sum(int from, int to) {
		int result = 0;
		for (int i = from; i <= to; i++) {
			result = result + i; // result +=i;
		}
		return result;
		//return�� ������ �������� ���ư��� ������ �� �Ʒ��� �ڵ忡�� ������ �� ����. 
		//return ������ �޼ҵ� ������ �������� ���ư��µ� ���� �Ȱ�������. �̷� ��� static �ڸ� void�� ħ(�� �ڸ��� ��� ���ư� ���� ���� �̾߱���)
		//return���� ���� �� �ִ� ���� 1���̴�. 2�� �̻� �����Ÿ� �迭�� ���� ��������
	}

	private static String evenOdd(int value) {
		String result = value % 2 == 0 ? "¦���Դϴ�" : "Ȧ���Դϴ�";
		return result;

	}

	public static void main(String[] args) {
		// 1
		int sum = sum(1, 10);
		System.out.println("����" + sum);
		System.out.println(evenOdd(sum));
		// 2
		sum = sum(1, 50);
		System.out.println("����" + sum);
		System.out.println(evenOdd(sum));
		// 3
		sum = sum(10, 50);
		System.out.println("����" + sum);
		System.out.println(evenOdd(sum));
		
		sum = sum(30);
		System.out.println("����" + sum);
		System.out.println(evenOdd(sum));

	}

}
// sum() method
