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
import org.apache.hadoop.hbase.util.Bytes;

import hbase.Hbase;
import hbase.HbaseDB;
import net.sf.json.JSONObject;  

/**
 * Servlet implementation class Agentsearch
 */
@WebServlet(name = "searchServlet", urlPatterns = { "/searchServlet" })
public class searchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     //   HbaseDB db=new HbaseDB();
        
        Configuration conf = HBaseConfiguration.create();
    	PrintWriter  writer  = null; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchServlet() {
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
		Hbase db=new Hbase();
		   
		  response.setContentType("text/html; charset=utf-8");
		  request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");
		  
		 
		  System.out.println("4654");
		  String name = request.getParameter("agentID");
		  System.out.println(name);
		  name = new String(name.getBytes("iso-8859-1"), "utf-8");
		  Hbase.id=name;
		    db.getOneRecord(name);
		  String []data=Hbase.data;
		  
		  for(int i=0;i<3;i++)
		  {
			  
			  System.out.println("a"+data[i]);
		  }
		  PrintWriter out = response.getWriter(); 
		  String json="{\"data\":[";
		  for(int i=0;i<data.length;i++)
		  {
			  json+="{\"item\":\""+Double.parseDouble(data[i])+"\"}";
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
          for(int i=0;i<3;i++)
          {
			  System.out.println("1:"+data[i]);
          }/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
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
