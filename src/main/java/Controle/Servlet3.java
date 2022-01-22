package Controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connexion.Connexion;

/**
 * Servlet implementation class Servlet3
 */
@WebServlet("/Servlet3")
public class Servlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user1=request.getParameter("user1");
		String pw=request.getParameter("pw");
		try {
			 PrintWriter out = response.getWriter();
			 /*Class.forName("com.mysql.cj.jdbc.Driver");
	          
	          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion","root","");
	          Statement s = con.createStatement();*/
		      Statement s = Connexion.getInstane().getConnection().createStatement();
	          out.println("578585785757578");
	          ResultSet r = s.executeQuery("select * from admin where Matricule='"+user1+"'and motdepasse='"+pw+"' ");
	          out.println("578585785757578");
	         if (r.next()) {
	        	 HttpSession session = request.getSession();

                 session.setAttribute("user1",user1 );
	      		  
                 request.getRequestDispatcher("adminPage.jsp").forward(request, response);
	      	 
	                 
	              }else {
	            	  request.setAttribute("error","login ou mot de pass incorectes !!!!");
	            	  request.getRequestDispatcher("adminlogin1.jsp").forward(request, response);
	            	 
	              }
		}catch(SQLException e) {
			e.getStackTrace();
		}
		 
		
		
	}

}
