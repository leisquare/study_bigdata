package strategy1.step2;

public class LowRobot extends Robot{
	public void actionFly() {
		System.out.println("날 수 없다.");
	}
	
	public void actionMissile() {
		System.out.println("미사일을 쏠 수 없다.");
	}
	
	public void actionKnife() {
		System.out.println("나이프가 없다.");
	}
}