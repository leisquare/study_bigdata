package com.lec.quest;

import java.util.Scanner;

public class Q5 {
	public static void main(String[] args) {
		Scanner lang = new Scanner(System.in);
		System.out.print("���������� �Է��ϼ��� :");
		int a = lang.nextInt();
		Scanner math = new Scanner(System.in);
		System.out.print("���������� �Է��ϼ��� :");
		int b = math.nextInt();
		Scanner eng = new Scanner(System.in);
		System.out.print("���������� �Է��ϼ��� :");
		int c = eng.nextInt();
		
		int resultSum;
		resultSum = (a+b+c);
		double resultAverage;
		resultAverage = (double)((a+b+c)/3.0);
		System.out.printf("�Է��Ͻ� ������ ���� %d�� ���� %d�� ���� %d���Դϴ�.",a,b,c);
		System.out.printf("������ %d�� ����� %.2f���Դϴ�.",resultSum,resultAverage);
		math.close();
		lang.close();
		eng.close();
		}

/*resultDouble = (double)(n1 / n2);
	System.out.printf("%d %c %d = %.3f\n", n1, '/', n2, resultDouble);
*/
	
}
