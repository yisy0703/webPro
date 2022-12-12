package singleton2;
public class FirstClass {
	public FirstClass() {
		System.out.println("FirstClass»ı¼ºÀÚ ½ÇÇàÁß");
		SingletonClass singletonObject = SingletonClass.getInstance();
		System.out.println("½Ì±ÛÅæ °´Ã¼ÀÇ i°ª : " + singletonObject.getI());
		singletonObject.setI(999);
		System.out.println("½Ì±ÛÅæ °´Ã¼ÀÇ i°ª ¼öÁ¤ÈÄ : " + singletonObject.getI());
	}
}
