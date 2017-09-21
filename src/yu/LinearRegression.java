package yu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import work.DB;

public class LinearRegression {  
	  
    private static final int MAX_POINTS = 10;  
    public static String agentid=Yuce.agentid;
    public static float month1=0;
    public static float month2=0;
    public static float month3=0;
    public static float sum=0;
    private double E;  
  
    /** 
     * Main program. 
     *  
     * @param args 
     *            the array of runtime arguments 
     */  
    public static void main(String args[]) {  
         search();
    	RegressionLine line = new RegressionLine();  
  
        line.addDataPoint(new DataPoint(1, month1));  
        line.addDataPoint(new DataPoint(2, month2));  
        line.addDataPoint(new DataPoint(3, month3));  
     
  
        printSums(line);  
        printLine(line);  
    }  
  
    /** 
     * Print the computed sums. 
     *  
     * @param line 
     *            the regression line 
     */  
    private static void printSums(RegressionLine line) {  
        System.out.println("\n数据点个数 n = " + line.getDataPointCount());  
        System.out.println("\nSum x  = " + line.getSumX());  
        System.out.println("Sum y  = " + line.getSumY());  
        System.out.println("Sum xx = " + line.getSumXX());  
        System.out.println("Sum xy = " + line.getSumXY());  
        System.out.println("Sum yy = " + line.getSumYY());  
  
    }  
  
    /** 
     * Print the regression line function. 
     *  
     * @param line 
     *            the regression line 
     */  
    public static void search()
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
	         
	             
	            String sql = "select sum(round) from sale where sale_nbr='"+agentid+"' and day_id between '31' and '60'";  
	            // 获取Statement  
	            Statement statement = conn.createStatement();  
	  
	            ResultSet resultSet = statement.executeQuery(sql);  
	  
	           
	            while (resultSet.next()) {  
	                 if(resultSet.getString(1)!=null)
	                 {
	                	 month2=Float.parseFloat(resultSet.getString(1));
	                 }
	                 if(resultSet.getString(1)==null)
	                 {
	                	 month2=0;
	                 }
	                 System.out.println(month2);
	  
	            }  
	      
	            
	            
	            String sql1 = "select sum(round) from sale where sale_nbr='"+agentid+"' and day_id between '1' and '30'";  
	            // 获取Statement  
	            Statement statement1 = conn.createStatement();  
	  
	            ResultSet resultSet1 = statement1.executeQuery(sql1);  
	  
	           
	            while (resultSet1.next()) {  
	  
	            	   if(resultSet1.getString(1)!=null)
		                 {
		                	 month1=Float.parseFloat(resultSet1.getString(1));
		                 }
		                 if(resultSet1.getString(1)==null)
		                 {
		                	 month1=0;
		                 }
		                 System.out.println(month1);
	            }  
	         
	            
	            String sql2 = "select sum(round) from sale where sale_nbr='"+agentid+"' and day_id between '61' and '91'";  
	            // 获取Statement  
	            Statement statement2 = conn.createStatement();  
	  
	            ResultSet resultSet2 = statement2.executeQuery(sql2);  
	  
	            
	            while (resultSet2.next()) {  
	            	   if(resultSet2.getString(1)!=null)
		                 {
		                	 month3=Float.parseFloat(resultSet2.getString(1));
		                 }
		                 if(resultSet2.getString(1)==null)
		                 {
		                	 month3=0;
		                 }
		                 System.out.println(month3);
	            }  
	            
	            resultSet.close(); 
	            resultSet1.close(); 
	            resultSet2.close(); 
	            statement.close();  
	            statement1.close();
	            statement2.close();
	            conn.close();  
	  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	    	System.out.println(month1+month2+month3+"hello");
	}
	
    private static void printLine(RegressionLine line) {  
        System.out.println("\n回归线公式:  y = " + line.getA1() + "x + "  
                + line.getA0());  
        
        sum=line.getA1()*4+line.getA0();
        System.out.println("误差：     R^2 = " + line.getR() +"sd"+sum);  
    }  
      
    //y = 2.1x + 133.7   2.1 * 6 + 133.7 = 12.6 + 133.7 = 146.3  
    //y = 2.1x + 133.7   2.1 * 7 + 133.7 = 14.7 + 133.7 = 148.4  
  
}  