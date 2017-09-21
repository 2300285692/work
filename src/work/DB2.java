package work;

import java.sql.*;
public class DB2 {
        
          public static String []data=new String[571231];
          public static String []data1=new String[571231];
          public static String []data2=new String[571231];
          public static String []data3=new String[571231];
         
	public void search()
	{
		
	    	try {
	            Class.forName("com.mysql.jdbc.Driver");     //加载MYSQL JDBC驱动程序   
	            System.out.println("Success loading Mysql Driver!");
	          }
	          catch (Exception e) {
	            System.out.print("Error loading Mysql Driver!");
	            e.printStackTrace();
	          }
	    	try {  

	            // 数据库连接 
	            Connection conn = DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/dbpeople","root","oracle");
	         
	            // 添加图书信息的SQL语句  
	            String sql = "select * from tongji";  
	            // 获取卖出量 
	            Statement statement = conn.createStatement();  
	  
	            ResultSet resultSet = statement.executeQuery(sql);  
	  
	           
	            while (resultSet.next()) {  
	  
	            	for(int i=0;i<571230;i++)
	            	 {
	            		data[i]=resultSet.getString(i+1);
	            		data1[i]=resultSet.getString(i+2);
	            		data2[i]=resultSet.getString(i+3);
	            		data3[i]=resultSet.getString(i+4);
	            		
	            		
	            	 }
	            } 
	          
	  
	            
	           
	            resultSet.close();
	            statement.close(); 
	           
	            conn.close(); 
     }
	    	catch (Exception e) {  
	            e.printStackTrace();
	            }
	        }  
	    	public static void main(String arg[]) {
	    		DB2 db=new DB2();
	        	db.search();
	        	for(int i=0;i<571230;i++)
	        	{
	        		System.out.println("1:"+data[i]);
	        		System.out.println("1:"+data1[i]);
	        		System.out.println("1:"+data2[i]);
	        		System.out.println("1:"+data3[i]);
	        	}
	    	}
	}
