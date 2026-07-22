package com.collection;
import java.util.*;
import java.util.HashMap;

public class HashMapdemp {

	public static void main(String[] args) {
		
	
	HashMap<Integer,String>map=new HashMap<Integer,String>();
    map.put(101,"Pallavi Karmore");
    map.put(102,"Rohit Sharma");
    map.put(103,"Virat kholi");
    map.put(null,"Kl Rahul");
    map.put(104,null);
    
    //Print all the key value pair
    System.out.println(map);
    
    System.out.println("-----------------");
    
    System.out.println("Return Size of map ");
    System.out.println(map.size());
    System.out.println("----------------------");
    
    System.out.println("Return only the keys ");
    System.out.println(map.keySet());
    
    System.out.println("--------------------------");
    System.out.println("Only return the values ");
    System.out.println(map.values());
    System.out.println("--------------------------");
    System.out.println("Update the exetisting data insert hrdik pandya on 104 key ");
    System.out.println(map.replace(104,"Hardik pyanda"));
    
    System.out.println("--------------");
  //  System.out.println(map.remove(null));
    System.out.println(map);
    System.out.println("-------------");
    
    System.out.println(map);
    
    
    Set<Entry<String,String>>entry=map.entrySet();
    for(Entry<String,String> data:entrySet) {
    	System.out.println(data.getKey()+ " "  +data.getvalues() );
    	
    }
    
    
    
}
    
}
