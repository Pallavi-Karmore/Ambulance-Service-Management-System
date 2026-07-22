package com.constructor;

public class Constructor {
	
	int id;
	String name;
	

	public Constructor() {
		System.out.println("default Constructor");
	}
	
	public Constructor(int id,String name) {
		this.id=id;
		this.name=name;
		
	}
	
	public static void main(String[] args) {
		Constructor c=new Constructor();
		System.out.println();
		
		Constructor c1=new Constructor(101,"Pallavi");
		Constructor c2=new Constructor(102,"Abc");
		System.out.println("Id : "  + c1.id + "  Name:"+c1.name );
		System.out.println(c2.id);


		
		
	}

}
