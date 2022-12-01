package com.lec.test;

public class ProgrammingLan {
	public static void main(String[] args) {
		int[] array = {76,45,34,89,100,50,90,92};
		int sum=0, avg=0,max=0,min=999;
		for(int i=0 ; i<array.length ; i++){
			sum += array[i];
			if(array[i]>max) max = array[i];
			if(array[i]<min) min = array[i];
		}
		avg = sum/array.length;
		System.out.printf("합계 = %d\t 평균 = %d\n",sum,avg);
		System.out.printf("최대 = %d\t 최소 = %d\n",max,min);
	}
}
