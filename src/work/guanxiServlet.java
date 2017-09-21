package work;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hadoop.hbase.util.Bytes;

import hbase.DB;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Agentsearch
 */
@WebServlet(name = "guanxiServlet", urlPatterns = { "/guanxiServlet" })
public class guanxiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DB db=new DB();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public guanxiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  //DB2 db=new DB2();
		 
   
		  response.setContentType("text/html; charset=utf-8");
		  request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");
		  
		 
		  System.out.println("4654");
		 
		  
        db.getALLData();
//	        db.getALLData1();
//	        db.getALLData2();
//	        db.getALLData3();
		//  System.out.println(DB.data);
	   String []sale1=DB.data;
	   String []buy1=DB.data1;
	   String []num1=DB.data2;
	   String []number1=DB.data3;
	     	 for(int i=0;i<buy1.length;i++)
				 {
		System.out.println(buy1[i]+"a");
				 }
//		 PrintWriter out = response.getWriter(); 
//		// System.out.println(buy);
//		  String json="{\"data\":[";
//		  for(int i=0;i<buy1.length;i++)
//		  {
//			  json+="{\"name\":\""+sale1[i]+"\",\"symbolSize\":\""+number1[i]+"\",\"draggable\":\""+true+"\",\"category\":\""+num1[i]+"\",\"value\":\""+buy1[i]+"\"}";
//			  if(i<buy1.length-1)
//			  {
//				  json+=",";
//			  }
//		  }
//		  json+="]}";
//			   
//		  out.write(json);  
//			  JSONObject jsonObject = new JSONObject();  
//		        
//	            jsonObject.put("data", json);
//
//			  System.out.println(json);
			  
			  
			  
//			  String json1="{\"links\":[";
//			  for(int i=0;i<buy1.length-1;i++)
//			  {
//				  json1+="{\"source\":\""+sale1[i]+"\",\"target\":\""+buy1[i]+"\"}";
//				  if(i<buy1.length-2)
//				  {
//					  json1+=",";
//				  }
//			  }
//			  json+="]}";
//				   
//			  out.write(json1);  
//				  JSONObject jsonObject1 = new JSONObject();  
//			        
//		            jsonObject.put("links", json1);
//
//				  System.out.println(json1);
//				  
//				  String json2="{\"categories\":[";
//				  for(int i=0;i<buy1.length-1;i++)
//				  {
//					  json2+="{\"name\":\""+sale1[i]+"\"}";
//					  if(i<buy1.length-1)
//					  {
//						  json2+=",";
//					  }
//					 
//				  }
//				  json+="]}";
//					   
//				  out.write(json2);  
//					  JSONObject jsonObject2 = new JSONObject();  
//				        
//			            jsonObject.put("categories", json2);
//
//					  System.out.println(json2);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
