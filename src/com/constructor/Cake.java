package com.constructor;

public class Cake {
	
	String flavour;
	int price;
	float weight;
	boolean egg;
	

	public Cake() {
		
		System.out.println("Cake is Already Prepared");
        flavour="Choklate";
        price=300;
        weight=400.5f;
        egg=true;
	}
    Cake(String flavour,int price,float weight,boolean egg){
	   
	   this.flavour=flavour;
	   this.price=price;
	   this.weight=weight;
	   this.egg=egg; 
   }
    
    public static void main(String[] args) {
    	
    	Cake c=new Cake();
    	System.out.println("Flavour : "+c.flavour + "  Price : "+c.flavour + " Weight : "+c.flavour  + " Egg : " + c.flavour );
		System.out.println("--------------------------------------------------------------------------");
    	
    	Cake c1=new Cake("Strawbery",500,469,true);
    	System.out.println("Flavour : "+c1.flavour + "  Price : "+c1.flavour + " Weight : "+c1.flavour  + " Egg : " + c1.flavour );
			}
}
