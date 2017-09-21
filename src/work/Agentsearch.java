package work;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hadoop.hbase.util.Bytes;

import hbase.HbaseDB;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Agentsearch
 */
@WebServlet(name = "Agentsearch", urlPatterns = { "/Agentsearch" })
public class Agentsearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Agentsearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  //DB2 db=new DB2();
		  HbaseDB db=new HbaseDB();
   
		  response.setContentType("text/html; charset=utf-8");
		  request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");
		  
		 
		  System.out.println("4654");
		  String name = request.getParameter("agentID");
		  System.out.println(name);
		  name = new String(name.getBytes("iso-8859-1"), "utf-8");
		  HbaseDB.agentid=name;
		  
	db.getOneRecord();
	  db.getOneRecord1();
	 
	  
		  String []data=HbaseDB.data;
		  String []data2=HbaseDB.data2;
		//  System.out.println(data);
		  
		  for(int i=1;i<92;i++)
		  {
			  
			  System.out.println("a"+data[i]);
		  }
		  for(int i=1;i<92;i++)
		  {
			  
			  System.out.println("b"+data2[i]);
		  }
		//  System.out.println(data2);
	/*	  int max_sale=HbaseDB.max_sale;
		  int min_sale=HbaseDB.min_sale;
		  int max_buy=HbaseDB.max_buy;
		  int min_buy=HbaseDB.min_buy;*/
		  PrintWriter out = response.getWriter(); 
		  String json="{\"data\":[";
		  for(int i=0;i<data.length-1;i++)
		  {
			  json+="{\"item\":\""+Double.parseDouble(data[i])+"\",\"item2\":\""+Double.parseDouble(data2[i])+"\"}";
			  if(i<data.length-2)
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
          for(int i=0;i<91;i++)
          {
			  System.out.println("1:"+data[i]+"   2:"+data2[i]+"end");
          }/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
