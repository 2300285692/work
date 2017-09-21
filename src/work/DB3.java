package work;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Random;

public class DB3 {
	
   public static String[][] num=new String[30][5];
   public static String agentid="O18";
   public String[][] str=new String[30][5];
   public Double[] gailv=new Double[30];
   public int arr[]=new int[30];
   public Double gai1[]=new Double[30];
   java.util.Random random=new java.util.Random();
   public static String result[][]=new String[30][6];
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
	                    "jdbc:mysql://localhost:3306/dblocal","root","199477");
	         
	            // 添加图书信息的SQL语句  
	            String sql = "select * from yuce2 where sale_id='"+agentid+"'";  
	            // 获取卖出量 
	            Statement statement = conn.createStatement();  
	  
	            ResultSet re = statement.executeQuery(sql);  
	  
	           
	             
	            	  for (int i = 0; re.next(); i++) {
	            	        for (int j = 0; j < 5; j++) {
	            	            num[i][j] = re.getObject(j+1).toString();
	            	        }
	            	    }
	            
	            
	            re.close();
	            statement.close(); 
	            conn.close(); 
	    	}
	            catch (Exception e) {  
		            e.printStackTrace();
		            }
	           
	            	for(int j=0;j<num.length;j++)
	            	{
	            		//num[2][j]
	            		if(num[j][2]==null)
	            		 {
	            			 gailv[j]=0.0;
	            	     }
	            		/*System.out.println(num[j][2]);*/
	            		 if(num[j][2]!=null)
	            			{
	            			gailv[j]=Double.parseDouble(num[j][2])/91.0;
	            			}
	            		
	            			/*System.out.println(gailv[j]+"456");*/
	            		 }
	        
	            for(int i=0;i<gailv.length-1;i++)
	            {
	            	System.out.println(gailv.length+"54");
	            	
	            	if(gailv[i]<=gailv[i+1])
	            	{
	            		gai1[i]=gailv[i+1];
	            		gai1[i+1]=gailv[i];
	            		arr[i+1]=i;
	            		arr[i]=i+1;
	            	}
	            	else
	            	{
	            		gai1[i+1]=gailv[i+1];
	            		gai1[i]=gailv[i];
	            		arr[i]=i;
	            		arr[i+1]=i+1;
	            	}
	            	System.out.println(gai1[i]+"地址"+arr[i]);//arr[]代表查询结果中的行标
	            }
	         
	          
	            
	           
	            
	        }
   public void daochu() throws FileNotFoundException
   {
	   
	   PrintWriter out2 = new PrintWriter("/usr/local/hadoop/yuce2.cvs");
	   out2.println("day_id"+"	"+"sale_id"+"	"+"buy_id"+"	"+"count_num"+"	"+"num"+"	"+"num_count"+'\t');
	   
	   for(int i=0;i<30;i++)
       {	Double n=0.0;	   
		   if(gai1[i]==0.0000000000000000)
		   {
		        n=0.0;	   
		   }
		   if(gai1[i]!=0.0000000000000000)
       	 {
			   n=Math.ceil(gai1[i]*30);
       	 }
       	for(int j=0;j<n;j++)
       	{
       	Random random = new Random();
       	out2.println(random.nextInt(29)+1+"	"+agentid+"	"+num[arr[i]][1]+"	"+Math.ceil(gai1[i]*30)+"	"+Double.parseDouble(num[arr[i]][3])/91.0+"	"+Double.parseDouble(num[arr[i]][4])/91.0);
          }
       	}
	 

	     out2.close(); 
   }
	  
	public static void main(String[] args) throws FileNotFoundException {
		DB3 db=new DB3();
			db.search();
	       db.daochu();
			 
			 
			/*for (int i = 0; i < num.length; i++) {
		        for (int j = 0; j < num[0].length; j++) {
		            System.out.print(num[i][j] + "\t");
		        }
		        System.out.println();
		    }*/
		

	}

}
