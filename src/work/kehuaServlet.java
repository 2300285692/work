package work;

import java.io.IOException;  
import java.io.PrintWriter;  
import java.util.ArrayList;  
import java.util.List;  
  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import org.apache.hadoop.conf.Configuration;  
import org.apache.hadoop.hbase.HBaseConfiguration;  
import org.apache.hadoop.hbase.HColumnDescriptor;  
import org.apache.hadoop.hbase.HTableDescriptor;  
import org.apache.hadoop.hbase.KeyValue;  
import org.apache.hadoop.hbase.MasterNotRunningException;  
import org.apache.hadoop.hbase.ZooKeeperConnectionException;  
import org.apache.hadoop.hbase.client.Delete;  
import org.apache.hadoop.hbase.client.Get;  
import org.apache.hadoop.hbase.client.HBaseAdmin;  
import org.apache.hadoop.hbase.client.HTable;  
import org.apache.hadoop.hbase.client.Put;  
import org.apache.hadoop.hbase.client.Result;  
import org.apache.hadoop.hbase.client.ResultScanner;  
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.util.Bytes;

import hbase.HbaseDB;
import hbase.base;
import net.sf.json.JSONObject;  

/**
 * Servlet implementation class Agentsearch
 */
@WebServlet(name = "kehuaServlet", urlPatterns = { "/kehuaServlet" })
public class kehuaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       // base db=new base();
        public static String data2[]=new String[3];
        
        Configuration conf = HBaseConfiguration.create();
    	PrintWriter  writer  = null; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public kehuaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try
		{
		base db=new base();
		   
		  response.setContentType("text/html; charset=utf-8");
		  request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");
		 // System.out.println("4654");
		  //jichang
		  String name = request.getParameter("agentID");
		  System.out.println(name);
		  name = new String(name.getBytes("iso-8859-1"), "utf-8");
		  db.agentid=name;
		  //市场
		  String name1 = request.getParameter("agent");
		  System.out.println(name1);
		  name1 = new String(name1.getBytes("iso-8859-1"), "utf-8");
		  db.agent=name1;
		  //市場
		 db.getALLData(name1);
		   //機場
		 db.getALLData1(name);
		 String []data=base.data;
		  String []data1=base.data1;
		  
		  for(int i=0;i<3;i++)
		  {
			  
			  System.out.println("a"+data[i]);
		  }
		  for(int i=0;i<3;i++)
		  {
			  
			  System.out.println("b"+data1[i]);
		  }
		  
		  
		 HTable table = new HTable(conf, "minhang");  
	  		Scan scan = new Scan();
	  		scan.addFamily("info".getBytes());
	  		Filter filter = db.andFilter(db.eqFilter("info","sale",name.getBytes()),db.eqFilter("info","buy1",name1.getBytes()));
	  		scan.setFilter(filter);
	  		ResultScanner res = table.getScanner(scan);
	  	  for (Result r : res) {  
	          KeyValue[] kv = r.raw();  
	        System.out.println(kv.length);
	          for (int i = 0; i < kv.length-1; i++) {  
	      
	           System.out.println(new String(kv[i].getValue()));
	         data2[i]=new String(kv[i].getValue());
	   
	  }
	  	  }
	  	  
	  	PrintWriter out = response.getWriter(); 
		  String json="{\"data\":[";
		  for(int i=0;i<data.length;i++)
		  {
			  json+="{\"item\":\""+data[i]+"\",\"item1\":\""+data1[i]+"\",\"item2\":\""+data2[i]+"\"}";
			  if(i<data.length-1)
			  {
				  json+=",";
			  }
		  }
		  json+="]}";
			  /*json="{\"data\":\""+data+"\",\"data2\":\""+data2+"\",\"avg_sale\":\""+avg_sale+"\",\"avg_buy\":\""+avg_buy+"\"}";*/
		  //json="{\"data\":\""+data+"\",\"data2\":\""+data2+"\"}";  
		  out.write(json);  
			  JSONObject jsonObject = new JSONObject();  
		        
	            jsonObject.put("data", json);

			  System.out.println(json);
	  	  
	  	  
		}
		  
    catch(Exception e)
		{
    	e.printStackTrace();
    	}
		}
        
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
