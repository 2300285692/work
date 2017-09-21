package work;

import java.sql.*;


public class DB {
	public static String o_numsum=new String();
	 public  static String c_numsum=new String();
	  public  static String p_numsum=new String();
	  public  static String s_numsum=new String();
	  

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
	            String sql = "select * from  tongji";  
	            // 获取Statement  
	            Statement statement = conn.createStatement();  
	  
	            ResultSet resultSet = statement.executeQuery(sql);  
	  
	           
	            while (resultSet.next()) {  
	  
	            	 DB.c_numsum=resultSet.getString(1);
	            	 DB.o_numsum=resultSet.getString(2);
	            	 DB.p_numsum=resultSet.getString(3);
	            	 DB.s_numsum=resultSet.getString(4);
	            	 System.out.println(DB.c_numsum);
	            	 System.out.println(DB.o_numsum);
	            	 System.out.println(DB.p_numsum);
	            	 System.out.println(DB.s_numsum);
	  
	            }  
	      
	            
	            
	           
	         
	           
	            
	            resultSet.close(); 
	            
	            statement.close();  
	            
	            conn.close();  
	  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	    	System.out.println(DB.p_numsum+"1");
	    	System.out.println(DB.o_numsum+"2");
	    	System.out.println(DB.s_numsum+"3");
	    	System.out.println(DB.c_numsum+"4");
	}
	
	public static void main(String arg[]) {
    	
    	DB db=new DB();
    	db.search();
    	System.out.println(p_numsum);
    	System.out.println(o_numsum);
    	System.out.println(s_numsum);
    	System.out.println(c_numsum);
    	
	}
	}   
