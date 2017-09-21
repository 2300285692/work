package hbase;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.filter.CompareFilter;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.filter.RowFilter;
import org.apache.hadoop.hbase.util.Bytes;

import work.DB2;

import org.apache.hadoop.hbase.client.Delete;


public class  Hbase
{
	private Connection conn;
	Configuration conf = HBaseConfiguration.create();
	PrintWriter  writer  = null; 
	public static String id="";
	public static String []data=new String[3];
	private static class HbaseInstance
	{
		private static final Hbase  instance=new Hbase();
	}
	public static Hbase getInstance() {
		return  HbaseInstance.instance;
	}
	public   Hbase() {
		//创建链接
		
		//zookeeper
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
	public  void getOneRecord (String keyvalue) throws IOException{  
		  try {  
		       HTable table = new HTable(conf, "jichang");  
		       Scan s = new Scan();  
		       Filter filter1 = new RowFilter(CompareFilter.CompareOp.EQUAL,
                     new BinaryComparator(keyvalue.getBytes()));
                    s.setFilter(filter1);
		       ResultScanner rs = table.getScanner(s);  
		       for (Result r : rs) {  
		          KeyValue[] kv = r.raw();  
		         // System.out.println(kv.length);
		          for (int i = 0; i < kv.length; i++) {  
		      
		             System.out.println(new String(kv[i].getValue()));
		            data[i]=new String(kv[i].getValue());
		             //System.out.println(data[i]);
		          }  
		         
		      }  
		   } catch (IOException e) {  
		         e.printStackTrace();  
		   } 
    }  
	
	
	  
	  
	 

	
	  public static void main(String arg[]) {
  		Hbase db=new Hbase();
      	try {
			db.getOneRecord("C1");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
      	
      
  	}
  
}
