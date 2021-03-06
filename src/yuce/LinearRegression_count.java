package yuce;

import java.io.IOException;
import java.io.PrintWriter;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.CompareFilter;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.RowFilter;

import work.DB;

public class LinearRegression_count {  
	  
    private static final int MAX_POINTS = 10;  
    public static String agentid=Yuce.agentid;
    public static float month1_count=0;
    public static float month2_count=0;
    public static float month3_count=0;
    public static float count=0;
    private double E;  
    public static Connection conn;
	 public static Configuration conf = HBaseConfiguration.create();
	PrintWriter  writer  = null; 
    /** 
     * Main program. 
     *  
     * @param args 
     *            the array of runtime arguments 
     */  
	
	public LinearRegression_count()
	{
		conf.set("hbase.zookeeper.quorum", "localhost");
		//hbase路径
		conf.set("hbase.rootdir", "hdfs://localhost:9000/hbase");
		try {
			//建立连接
			conn = ConnectionFactory.createConnection(conf);
			System.out.println("连接成功");
		} catch (IOException e)
		{
			System.out.println("连接失败");
			e.printStackTrace();
		}
		
		
	}
    public static void main(String args[]) {  
         search();
    	RegressionLine line = new RegressionLine();  
  
        line.addDataPoint(new DataPoint(1, month1_count));  
        line.addDataPoint(new DataPoint(2, month2_count));  
        line.addDataPoint(new DataPoint(3, month3_count));  
     
  
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
		       HTable table = new HTable(conf, "small");  
		       Scan s = new Scan();  
		       Filter filter1 = new RowFilter(CompareFilter.CompareOp.EQUAL,
                  new BinaryComparator(agentid.getBytes()));
                 s.setFilter(filter1);
		       ResultScanner rs = table.getScanner(s);  
		       for (Result r : rs) {  
		          KeyValue[] kv = r.raw();  
		         // System.out.println(kv.length);
		          for (int i = 0; i < kv.length; i++) {  
		      
		             System.out.println(new String(kv[i].getValue()));
		       // data[i]=new String(kv[i].getValue());
		             //System.out.println(data[i]);
		          }  
		         
		      }  
		   } catch (IOException e) {  
		         e.printStackTrace();  
		   } 
    	
    	
	      
	            
	            
    	try {  
		       HTable table = new HTable(conf, "small1");  
		       Scan s = new Scan();  
		       Filter filter1 = new RowFilter(CompareFilter.CompareOp.EQUAL,
               new BinaryComparator(agentid.getBytes()));
              s.setFilter(filter1);
		       ResultScanner rs = table.getScanner(s);  
		       for (Result r : rs) {  
		          KeyValue[] kv = r.raw();  
		         // System.out.println(kv.length);
		          for (int i = 0; i < kv.length; i++) {  
		      
		             System.out.println(new String(kv[i].getValue()));
		         //   data[i]=new String(kv[i].getValue());
		             //System.out.println(data[i]);
		          }  
		         
		      }  
		   } catch (IOException e) {  
		         e.printStackTrace();  
		   } 
	            
    	try {  
		       HTable table = new HTable(conf, "small2");  
		       Scan s = new Scan();  
		       Filter filter1 = new RowFilter(CompareFilter.CompareOp.EQUAL,
               new BinaryComparator(agentid.getBytes()));
              s.setFilter(filter1);
		       ResultScanner rs = table.getScanner(s);  
		       for (Result r : rs) {  
		          KeyValue[] kv = r.raw();  
		         // System.out.println(kv.length);
		          for (int i = 0; i < kv.length; i++) {  
		      
		             System.out.println(new String(kv[i].getValue()));
		         //   data[i]=new String(kv[i].getValue());
		             //System.out.println(data[i]);
		          }  
		         
		      }  
		   } catch (IOException e) {  
		         e.printStackTrace();  
		   } 
    	
    	System.out.println(month1_count+month2_count+month3_count+"hello");
	           
	        } 
	    	
	
	
    private static void printLine(RegressionLine line) {  
        System.out.println("\n回归线公式:  y = " + line.getA1() + "x + "  
                + line.getA0());  
        
        count=line.getA1()*4+line.getA0();
        System.out.println("误差：     R^2 = " + line.getR() +"sd"+count);  
    }  
      
 
  
}  