package com.collection;
import java.util.*;
public class ArrayListDemo {
	
	public static void main(String[] args) {
		
	

	ArrayList<Integer>al=new ArrayList<Integer>();
	al.add(101);
	al.add(102);
	al.add(103);
	al.add(104);
	al.add(110);
	
	System.out.println(al);

	
	 ArrayList<Object>ob=new ArrayList<Object>();
	 ob.add("Abc");
	 ob.add(101);
	 ob.add(true);
	 System.out.println(ob);
	 
	 //sequence is mandetory if we explicitly spcify it.
	 
	 ArrayList<Integer>a=new ArrayList<Integer>();
	 a.add(0,101);//0
	 a.add(1,102);//1
	 a.add(500);//2
	 a.add(400);//3
	 a.add(3,600);
	 System.out.println(a);
System.out.println(a.get(3));
	 
	 
	}

}
