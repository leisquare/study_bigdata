package singleton_step2;

public class TestMain {
	public static void main(String[] args) {
		FirstClass firstObj = new FirstClass();
		SecondClass SecondObj = new SecondClass();
		SingletonClass singObj = SingletonClass.getInstance();
		System.out.println("메인메소드에서 singobj안의 i값은 "+singObj.getI());
	}
}
