package com.creatId;

public class CreatId {
public static String creatId(int index) {
	String head = "C";
	String zero ="";
	int length = String.valueOf(index+1).length();
	System.out.println("length:"+length);
	for (int i = 0; i < 4-length; i++) {
		zero = zero +"0";
		System.out.println(zero);
	}
	String catalogId = head + zero +(index+1);
	return catalogId;
}
}
