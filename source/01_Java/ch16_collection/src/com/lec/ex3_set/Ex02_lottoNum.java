package com.lec.ex3_set;
import java.util.Random;
import java.util.TreeSet;
public class Ex02_lottoNum {
	public static void main(String[] args) {
		// HashSet<Integer> lotto = new HashSet<Integer>();
		TreeSet<Integer> lotto = new TreeSet<Integer>();
		Random random = new Random();
		int i=0;
		while(lotto.size()<6) {
			lotto.add(random.nextInt(45)+1);
			i++;
		}// 6회 로또 번호 추출
		System.out.println(i+"번 뽑은 로또 번호 : " +lotto);
	}
}
