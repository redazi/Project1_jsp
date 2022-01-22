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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Servlet4
 */
@WebServlet("/Servlet4")
public class Servlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet4() {
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
		
		String mat=request.getParameter("mat");
		try {
			 
			 Class.forName("com.mysql.cj.jdbc.Driver");
	          
	          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion?serverTimezone=UTC","root","");
	          Statement s = con.createStatement();
	         
	          ResultSet r = s.executeQuery("select * from voiture where num_matricule='"+mat+"'");
	          
	         if (r.next()) {
	        	 
	        	 String query = "delete from voiture where num_matricule=?";
                 PreparedStatement preparedStmt = con.prepareStatement(query);
                 preparedStmt.setString(1,mat);
                
                 preparedStmt.executeUpdate();
                 request.setAttribute("error70","supprimer avec succes");
           	  request.getRequestDispatcher("supprimer.jsp").forward(request, response);
	       	 
	                 
	              }else {
	            	
	            	  request.setAttribute("error7","ce matricule n'existe pas");
	            	  
	            	  request.getRequestDispatcher("supprimer.jsp").forward(request, response);
	              }
		}catch(SQLException | ClassNotFoundException e) {
			e.getStackTrace();
		}
		 
		
		
		
	}

}
