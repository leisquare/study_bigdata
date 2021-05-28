package com.lec.person_dao;

import java.util.ArrayList;
import java.util.Scanner;

public class PersonMngDao {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		PersonDao dao = PersonDao.getInstance();
		String fn;
		ArrayList<PersonDto> person;
		do {
			System.out.println("1:입력 2:직업별 출력 3:전제출력  그외: 종료>");
			fn = scanner.next();
			switch (fn) {
			case "1": // 이름, 직업명, 국영수 입력받아 dao.insertPerson()호출
				System.out.println("입력할 이름?");
				String name = scanner.next();
				System.out.println("입력할 직엄?");
				String jname = scanner.next();
				System.out.println("입력할 국어?");
				int kor = scanner.nextInt();
				System.out.println("입력할 영어?");
				int mat = scanner.nextInt();
				System.out.println("입력할 수학?");
				int eng = scanner.nextInt();
				PersonDto newPerson = new PersonDto(name, jname, kor, eng, mat);
				int result = dao.insertPerson(newPerson); // 입력 끝
				System.out.println(result == PersonDao.SUCCESS ? "입력성공" : "실패");

				break;
			case "2": // 직업명 입력받아 dao.selectJname()호출하여 결과 출력
				System.out.println("조회할 직업명은? 배우|가수|mc");
				jname = scanner.next();
				person = dao.selectJname(jname);
				if (person.size() != 0) {
					System.out.println("등수\t 이름\t 직업\t 국어\t 영어\t 수학\t 총점");
					for (PersonDto p : person) {
						System.out.println(p);
					}
				} else {
					System.out.println("해당 직업명의 이원이 없습니다");
					
				}

				break;
			case "3": // dao.selectAll() 호출하여 결과 출력
				person = dao.selectAll();
				if (person.size() != 0) {
					System.out.println("등수\t 이름\t 직업\t 국어\t 영어\t 수학\t 총점");
					for (PersonDto p : person) {
						System.out.println(p);
					}
				} else {
					System.out.println("해당 직업명의 이원이 없습니다");
				}
				break;
			}
		} while (fn.equals(1) || fn.equals(2) || fn.equals(3));
		System.out.println("BYE");

	}
}
