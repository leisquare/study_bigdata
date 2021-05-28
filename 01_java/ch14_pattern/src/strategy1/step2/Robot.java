package strategy1.step2;

public class Robot {
	public void shape() {
		System.out.println(getClass().getName() + "은 팔, 다리, 머리, 몸통으로 이루어져 있다");
	}

	public void actionWalk() {
		System.out.println("걸을 수 있다.");
	}

	public void actionRun() {
		System.out.println("뛸 수 있다.");
	}
}