package com.lec.ex;
//��������(&&: and ||: or)
//true && true = true
//true && false = false
//false && true = false
//false && false = false
public class Ex04 {
	public static void main(String[] args) {
		 int i = 1, j=10, h=10;
		 System.out.printf("i<j && ++j>h �� " +((i<j) && (++j>h)));
		 System.out.println("\nj="+j);
		 //
		 System.out.printf("i>j && ++j>h �� " +((i>j) && (++j>h)));
		 System.out.println("\nj="+j);
		 //(i>j) && (++j>h)���� ������ �̹� false�� ���� ������ ���ع����� false�� ����Ѵ�.
		 //�ᱹ, ++j�� ������� �ʾƼ� j���� ������ �ʾҴ�.
		 //System.out.println("\nj="+j);
		 //�̰��� ��Ʈ��+������ �� �� ��� �ڸ� �׳� ��Ʈ������ ��ȯ�ؼ� �ٿ������� ������
		 
		 System.out.printf("i<j || ++j>h �� " +((i<j) || (++j>h)));
		 System.out.println("\nj="+j);
		 //
		 System.out.printf("i>j || ++j>h �� " +((i>j) || (++j>h)));
		 System.out.println("\nj="+j);
		//���ʵ� ���� true�� true�� �����ع����� �Ѿ��. 
	}
}
