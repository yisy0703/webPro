package singleton2;
public class TestMain {
	public static void main(String[] args) {
		FirstClass firstObj = new FirstClass();
		SecondClass secondObj = new SecondClass();
		SingletonClass singObj = SingletonClass.getInstance();
		System.out.println("mainÇÔ¼ö¿¡¼­ ½Ì±ÛÅæ °´Ã¼ÀÇ i°ª : " + singObj.getI());
	}
}
