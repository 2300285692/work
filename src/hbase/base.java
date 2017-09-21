package hbase;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

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
import org.apache.hadoop.hbase.client.coprocessor.AggregationClient;
import org.apache.hadoop.hbase.client.coprocessor.DoubleColumnInterpreter;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.NullComparator;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.filter.QualifierFilter;
import org.apache.hadoop.hbase.filter.RegexStringComparator;
import org.apache.hadoop.hbase.filter.RowFilter;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.filter.SubstringComparator;
import org.apache.hadoop.hbase.util.Bytes;

import work.DB2;

import org.apache.hadoop.hbase.client.Delete;


public class  base

{
	private Connection conn;
	static Configuration conf = HBaseConfiguration.create();
	PrintWriter  writer  = null; 
	public static String agentid="";
	public static String agent="";
	public static String data[]=new String[3];
	public static String data1[]=new String[3];
	public static String data2[]=new String[3];
	private static class baseInstance
	{
		private static final base  instance=new base();
	}
	public static base getInstance() {
		return  baseInstance.instance;
	}
	public   base() {
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
	
	//得到全市场
	 public void getALLData(String keyvalue) {  
		 try {  
			 HTable table = new HTable(conf, "shichang"); 
		       Scan s = new Scan();  
		       Filter filter1 = new RowFilter(CompareFilter.CompareOp.EQUAL,
                   new BinaryComparator(keyvalue.getBytes()));
                  s.setFilter(filter1);
		       ResultScanner rs = table.getScanner(s);  
		       for (Result r : rs) {  
		          KeyValue[] kv = r.raw();  
		         // System.out.println(kv.length);
		          for (int i = 0; i < kv.length; i++) {  
		        	  System.out.print(new String(kv[i].getQualifier()) + ":");
		             System.out.println(new String(kv[i].getValue()));
		            data[i]=new String(kv[i].getValue());
		             //System.out.println(data[i]);
		          }  
		         
		      }  
		   } catch (IOException e) {  
		         e.printStackTrace();  
		   } 
  }  
	 //得到全机场
	 public void getALLData1(String keyvalue) {  
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
		        	  System.out.print(new String(kv[i].getQualifier()) + ":");
		             System.out.println(new String(kv[i].getValue()));
		            data1[i]=new String(kv[i].getValue());
		             //System.out.println(data[i]);
		          }  
		         
		      }  
		   } catch (IOException e) {  
		         e.printStackTrace();  
		   } 
  }  
	 public static Filter eqFilter(String cf, String col, byte[] val) {
	        SingleColumnValueFilter f = new SingleColumnValueFilter(cf.getBytes(), col.getBytes(), CompareFilter.CompareOp.EQUAL, val);
	        f.setLatestVersionOnly(true);
	        f.setFilterIfMissing(true);
	        return f;
	    }
	 
	   
	  
	  
	    public static Filter andFilter(Filter... filters) {
	        FilterList filterList = new FilterList(FilterList.Operator.MUST_PASS_ALL);
	        if(filters!=null && filters.length > 0) {
	            if(filters.length > 1) {
	                for (Filter f : filters) {
	                    filterList.addFilter(f);
	                }
	            }
	            if(filters.length == 1) {
	                return filters[0];
	            }
	        }
	        return filterList;
	    }
	 
	    /**
	     * 和过滤器 相当于SQL的 的 and
	     * @param filters 多个过滤器
	     * @return 过滤器
	     */
	    public static Filter andFilter(Collection<Filter> filters) {
	        return andFilter(filters.toArray(new Filter[0]));
	    }
	 
	 
	 
	  
	 
	   
	  public static void main(String arg[]) throws IOException {
  		base  db=new base();
  		db.getALLData("O100");
  		System.out.println("a");
  		db.getALLData1("C32");
  		System.out.println("b");
  		try
  		{
  	  HTable table = new HTable(conf, "minhang");  
  		Scan scan = new Scan();
  		scan.addFamily("info".getBytes());
  		Filter filter = db.andFilter(db.eqFilter("info","sale","C32".getBytes()),db.eqFilter("info","buy1","O100".getBytes()));
  		scan.setFilter(filter);
  		ResultScanner res = table.getScanner(scan);
  	  for (Result r : res) {  
          KeyValue[] kv = r.raw();  
        System.out.println(kv.length);
          for (int i = 0; i < kv.length-1; i++) {  
        	  System.out.print(new String(kv[i].getQualifier()) + ":");
           System.out.println(new String(kv[i].getValue()));
         data2[i]=new String(kv[i].getValue());
//             System.out.println(data[i]);
          
          }}
  } catch (IOException e) {  
    e.printStackTrace();  
}  
  		
      
  	}
  
}
