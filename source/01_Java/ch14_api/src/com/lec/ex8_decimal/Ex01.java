package com.lec.ex8_decimal;
import java.text.DecimalFormat;
// 숫자 자리수 : #(있으면 출력, 없으면 출력안함), 0(반드시 출력)
// .(소수점) ,(세자리마다) %, E(지수형. 0.00012=>1.2E-4)
public class Ex01 {
	public static void main(String[] args) {
		double number = 1234567.8787;
		DecimalFormat df1 = new DecimalFormat("########.#####");
		System.out.println("########.##### : " + df1.format(number));
		DecimalFormat df2 = new DecimalFormat("00000000.00000");
		System.out.println("00000000.00000 : " + df2.format(number));
		DecimalFormat df3 = new DecimalFormat("0,000.00");
		System.out.println("0,000.00 : " + df3.format(number));
		DecimalFormat df4 = new DecimalFormat("##.##%");
		System.out.println("##.##% : " + df4.format(0.78457));
		DecimalFormat df5 = new DecimalFormat("#.####E0"); // E뒤에는 0만 가능
		System.out.println("#.####E0 : " + df5.format(number));
	}
}












