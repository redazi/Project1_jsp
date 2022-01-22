package Controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connexion.Connexion;

/**
 * Servlet implementation class Servlet10
 */
@WebServlet("/Servlet10")
public class Servlet10 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet10() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String mat=request.getParameter("hide1");
		String log1=request.getParameter("hide2");
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int r = 0;
		
		System.out.println(mat);
		System.out.println(log1);
	
		try {
			 
			 //Class.forName("com.mysql.cj.jdbc.Driver");
	          
	         // Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion","root","");
	          //Statement s = con.createStatement();
	          Statement s = Connexion.getInstane().getConnection().createStatement();
	          System.out.println(mat);
	  		System.out.println(log1);
	           r = s.executeUpdate("delete from reservation where log='"+log1+"' and code='"+mat+"'");
	           System.out.println(mat);
	   		
	   		System.out.println(log1);
	         if (r>0) {
	        	 
	        	 
              
             
               request.setAttribute("error777","supprimer avec succes");
               request.getRequestDispatcher("mesReservations.jsp").forward(request, response);
	       	 
	                 
	              }else {
	            	
	            	  request.setAttribute("error7777","erreur de suppression!!");
	            	  
	            	  request.getRequestDispatcher("mesReservations.jsp").forward(request, response);
	              }
		}catch(SQLException e) {
			e.getStackTrace();
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
