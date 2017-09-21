package work;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yu.LinearRegression;
import yu.LinearRegression_count;
import yu.Yuce;

/**
 * Servlet implementation class Yuce
 */
@WebServlet(name = "Yuce1", urlPatterns = { "/Yuce1" })
public class Yuce1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Yuce1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Yuce db=new Yuce();
		String[] args=null;
		response.setContentType("text/html; charset=utf-8");
		  request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");
		  System.out.println("asd");
		  String name = request.getParameter("agentID");
		  System.out.println(name);
		  name = new String(name.getBytes("iso-8859-1"), "utf-8");
		  Yuce.agentid=name;
		  LinearRegression_count.main(args);
			LinearRegression.main(args);
				db.search();
		       db.daochu();
		  PrintWriter out = response.getWriter(); 
		  String json="{\"data\":\""+name+"\"}";
		  out.write(json);  
		  System.out.println(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
