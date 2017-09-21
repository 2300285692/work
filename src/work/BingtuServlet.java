package work;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class BingtuServlet
 */
@WebServlet(name = "Bingtu1Servlet", urlPatterns = { "/Bingtu1Servlet" })
public class BingtuServlet extends HttpServlet {
	 
	private static final long serialVersionUID = 1L;


	
    



  
	/**
     * @see HttpServlet#HttpServlet()
     */
    public BingtuServlet() {
    	
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
       
        protected void doGet(HttpServletRequest request,  
                HttpServletResponse response) throws ServletException, IOException { 
        
        	DB db=new DB();
        	db.search();
        	String c_numsum=DB.c_numsum;
            String o_numsum=DB.o_numsum;
            String p_numsum=DB.p_numsum;
         	
        	
         	JSONObject jsonObject = new JSONObject();  
        
            jsonObject.put("c_numsum", c_numsum);
            jsonObject.put("o_numsum", o_numsum);
            jsonObject.put("p_numsum", p_numsum);
            PrintWriter out = response.getWriter();  
            String json="";
            json="{\"c_numsum\":\""+c_numsum+"\",\"o_numsum\":\""+o_numsum+"\",\"p_numsum\":\""+p_numsum+"\"}";
            out.write(json);  
         	
            
            response.setContentType("text/json; charset=UTF-8");  
         	
            /*System.out.println("hello"+c_numsum);
                request.setAttribute("c_numsum", c_numsum);  
                
                request.setAttribute("o_numsum", o_numsum);  
                
             
                request.setAttribute("p_numsum", p_numsum);  
             
      
            request.getRequestDispatcher("NewFile1.jsp")    
            .forward(request, response);
            return ;*/
      
        }  
      
       
    	/** 
         * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse 
         *      response) 
         */  
        protected void doPost(HttpServletRequest request,  
                HttpServletResponse response) throws ServletException, IOException {  
            // TODO Auto-generated method stub  
            doGet(request, response);  
        }  

}
