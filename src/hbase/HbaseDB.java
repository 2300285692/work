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


public class  HbaseDB
{
	private Connection conn;
	Configuration conf = HBaseConfiguration.create();
	PrintWriter  writer  = null; 
	public static String agentid="";
    public static String []data=new String[92];
    public static String []data2=new String[92];
    public static int max_buy=0;
    public static int min_buy=0;
    public static int max_sale=0;
    public static int min_sale=0;
	private static class HBaseDBInstance
	{
		private static final HbaseDB  instance=new HbaseDB();
	}
	public static HbaseDB getInstance() {
		return  HBaseDBInstance.instance;
	}
	public   HbaseDB() {
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
	  public  void getOneRecord () throws IOException{  
		  try {  
		       HTable table = new HTable(conf, "buy");  
		       Scan s = new Scan();  
		       Filter filter1 = new RowFilter(CompareFilter.CompareOp.EQUAL,
                       new BinaryComparator(agentid.getBytes()));
                      s.setFilter(filter1);
		       ResultScanner rs = table.getScanner(s);  
		       for (Result r : rs) {  
		          KeyValue[] kv = r.raw();  
		         // System.out.println(kv.length);
		          for (int i = 0; i < kv.length; i++) {  
		       //   System.out.print(new String(kv[i].getRow()) + "  ");  
		           //   System.out.print(new String(kv[i].getFamily()) + ":");  
//		              System.out.print(new String(kv[i].getQualifier()) + "  ");  
		             // System.out.print(kv[i].getTimestamp() + "  ");  
		           //  System.out.println(new String(kv[i].getValue()));  
		             System.out.println(new String(kv[i].getValue()));
		             data[i]=new String(kv[i].getValue());
		             //System.out.println(data[i]);
		          }  
		          
		      }  
		   } catch (IOException e) {  
		         e.printStackTrace();  
		   } 
      }  
	  public  void getOneRecord1 () throws IOException{  
		  try {  
		       HTable table = new HTable(conf, "sales");  
		       Scan s = new Scan();  
		       Filter filter1 = new RowFilter(CompareFilter.CompareOp.EQUAL,
                       new BinaryComparator(agentid.getBytes()));
                      s.setFilter(filter1);
		       ResultScanner rs = table.getScanner(s);  
		       for (Result r : rs) {  
		          KeyValue[] kv = r.raw();  
		          for (int i = 0; i < kv.length; i++) {  
		       //    System.out.print(new String(kv[i].getRow()) + "  ");  
		           //   System.out.print(new String(kv[i].getFamily()) + ":");  
//		              System.out.print(new String(kv[i].getQualifier()) + "  ");  
		             // System.out.print(kv[i].getTimestamp() + "  ");  
		           //  System.out.println(new String(kv[i].getValue()));  
		             System.out.println(new String(kv[i].getValue()));
		             data2[i]=new String(kv[i].getValue());
		          }  
		      }  
		   } catch (IOException e) {  
		         e.printStackTrace();  
		   } 
      }  
	  
	  
	  
	 
//	    protected void doPost(HttpServletRequest request, HttpServletResponse response)  
//                throws ServletException, IOException {  
//            response.setContentType("text/html;charset=GBK");  
//             writer = response.getWriter();  
//            // TODO Auto-generated method stub  
//             try {  
//                 String tablename = "buy";  
//      getValu           
//                    
//                 writer.println("===========get one record========");  
//                 writer.println("<br>");  
//                 this.getOneRecord(tablename, "O100");  
//                 
//                    
//                
//             } catch (Exception e) {  
//                 e.printStackTrace();  
//             }  
//              
//        }  
//      
//        protected void doGet(HttpServletRequest request, HttpServletResponse response)  
//                throws ServletException, IOException {  
//            // TODO Auto-generated method stub  
//            doPost(request, response);  
//        }  
//        
	  
	
	  public static void main(String arg[]) {
  		HbaseDB db=new HbaseDB();
      	try {
			db.getOneRecord();
			
			
			db.getOneRecord1();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
      	for(int i=1;i<92;i++)
      	{
      		System.out.println("1:"+data[i]+"  2:"+data2[i]);
      	}
  	}
  
}
	/**
	 * 鏍规嵁琛ㄥ悕绉板拰鍒楁棌鍒涘缓琛�
	 * @param tableName
	 * @param columnFamilies
	 */
/*	public void createTable(String tableName, String[] columnFamilies,int maxVersions) {
		deleteTable(tableName);
		try {
			Admin admin = conn.getAdmin();
			//鎸囧畾琛ㄥ悕绉�
			HTableDescriptor descriptor = new HTableDescriptor(TableName.valueOf(tableName));
			//娣诲姞鍒楁棌
			for (String string : columnFamilies) {
				HColumnDescriptor family = new HColumnDescriptor(Bytes.toBytes(string));
				//family.setMaxVersions(maxVersions);
				descriptor.addFamily(family);
			}
			admin.createTable(descriptor);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	*//**
	 * 鏍规嵁琛ㄥ悕绉板垹闄よ〃
	 * @param tableName
	 */
	/*public void deleteTable(String tableName) {
		try {
			Admin admin = conn.getAdmin();
			if(admin.tableExists(TableName.valueOf(tableName))) {
				//disabled
				admin.disableTable(TableName.valueOf(tableName));
				//drop
				admin.deleteTable(TableName.valueOf(tableName));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	*//**
	 * 鏍规嵁琛ㄥ悕绉拌幏鍙杢able瀵硅薄
	 * @param tableName
	 * @return
	 */
	
	
	
	
//	public Long getId(String tableName,String family,String qualifier)
//	{
//		Long id=null;
//		Table table=getTable(tableName);
//		try
//		{
//			id=table.incrementColumnValue(Bytes.toBytes(ConstantsHBase.ROW_KEY_GID_ACTIVITY_ID), Bytes.toBytes(family),Bytes.toBytes(qualifier), 1);
//		} catch (IOException e)
//		{
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return id;
//	}
//	
//	
//	public Result get(String tableName,String rowkey,String family,String[] Columns) throws IOException
//	{
//			Table table = conn.getTable(TableName.valueOf(tableName));
//			Get get = new Get(Bytes.toBytes(rowkey));
//			//获取版本的数量
//			//get.setMaxVersions(5);
//			
//			if(Columns!=null)
//			{
//				for (String string : Columns)
//				{
//					get.addColumn(Bytes.toBytes(family), Bytes.toBytes(string));
//				}
//			}
//			Result result = table.get(get);
//			table.close();
//			return result;
//
//	}
//public Result get(String tableName,int rowkey,String family,String[] Columns) throws IOException
//{
//		Table table = conn.getTable(TableName.valueOf(tableName));
//		Get get = new Get(Bytes.toBytes(rowkey));
//		//获取版本的数量
//		//get.setMaxVersions(5);
//			
//		if(Columns!=null)
//		{
//			for (String string : Columns)
//			{
//				get.addColumn(Bytes.toBytes(family), Bytes.toBytes(string));
//			}
//		}
//		Result result = table.get(get);
//		table.close();
//		return result;
//
//}
//public ResultScanner scan(String tableName,Filter filter)"O100")
//{
//	ResultScanner resultScanner=null;
//	try
//	{
//		Table table = conn.getTable(TableName.valueOf(tableName));
//		Scan scan = new Scan();
//		scan.setFilter(filter);
//	    resultScanner = table.getScanner(scan);
//		for (Result result : resultScanner) {
//			System.out.println(result);
//		}
//		resultScanner.close();
//		table.close();
//
//	} catch (Exception e)
//	{
//		// TODO: handle exception
//	}
//	return resultScanner;
//}
// public void Delete(String tableName,Integer rowkey,String family,String qualifier) 
// {
//	try {
//		Table table = conn.getTable(TableName.valueOf(tableName));
//		Delete delete = newHbaseDB db=new HbaseDB(); Delete(Bytes.toBytes(rowkey));
//		delete.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier));
//		table.delete(delete);
//		table.close();
//	} catch (Exception e) {
//		e.printStackTrace();
//	}
//}*/
	

