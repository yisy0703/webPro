package singleton2;
public class SecondClass {
	public SecondClass() {
		System.out.println("SecondClass 积己磊 角青 吝");
		SingletonClass singletonObject = SingletonClass.getInstance(); 
		System.out.println("教臂沛 按眉狼 i蔼篮 " + singletonObject.getI());
	}
}
