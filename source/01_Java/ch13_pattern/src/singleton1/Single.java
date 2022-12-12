package singleton1;
/* 메모리 영역 데이터 영역    │   heap 영역
 *   클래스 & static    │   일반 변수   */
public class Single {
	private int i;
	private Single() {}
	private static Single INSTANCE = new Single();
	public static Single getInstance() {
		// 생성된 객체 주소를 return
		return INSTANCE;
	}
//	private static Single INSTANCE;
//	public static Single getInstance() {
//		// 객체생성했으면 그 객체 주소를 return하고
//		// 객체생성 안 했으면 객체생성하고 그 주소를 return
//		if(INSTANCE==null) {
//			INSTANCE = new Single(); //  객체 생성
//		}
//		return INSTANCE;
//	}
	public int getI() {
		return i;
	}
	public void setI(int i) {
		this.i = i;
	}
}
