package com.lec.quest;
//�� ���� �Է¹޾� �� ���� ������ ����� o�� x�� ���

import java.util.Scanner;

public class Q3 {
	public static void main(String[] args) {
		Scanner first = new Scanner(System.in);
		System.out.print("ù��° ���ڸ� �Է��ϼ��� :");
		int a = first.nextInt();
		Scanner second = new Scanner(System.in);
		System.out.print("�ι�° ���ڸ� �Է��ϼ��� :");
		int b = second.nextInt();

		System.out.println("�� ���� ���� ���ΰ���?");
		System.out.println(a==b? "O":"X");
		System.out.println("ù��° �Է��� �� a�� �� ū����?");
		System.out.println(a>b? "O":"X");
		first.close();
		second.close();
	
		
	}
}

