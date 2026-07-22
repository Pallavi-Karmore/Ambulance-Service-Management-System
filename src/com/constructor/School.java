package com.constructor;

public class School {

	public School() {
		
     System.out.println("deafault constructor");
	}
	
	public static void main(String[] args) {
		Student s=new Student();
		
		//Setting values in private variable 
		s.setID(1);
		s.setName("Rohit sharma");
		
		// Retreiving the values of private variable using getter methods 
		System.out.println(s.getId());
		System.out.println(s.getName());
		
		
		
		
		
		
	}

}
