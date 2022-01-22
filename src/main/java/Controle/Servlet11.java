package Controle;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connexion.Connexion;

/**
 * Servlet implementation class Servlet11
 */
@WebServlet("/Servlet11")
public class Servlet11 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet11() {
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
		doGet(request, response);
		String hide3 = request.getParameter("hide5");
		String hide4 = request.getParameter("hide6");
    System.out.println(hide3);
    System.out.println(hide4);
    System.out.println("rooooblaaaaaaaaaaaaaaaaaaaaa");
    System.out.println(hide4);
		try {
		       
		   
		   
		    //Class.forName("com.mysql.cj.jdbc.Driver");
		    
		    //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion","root","");
		    //Statement s = con.createStatement();
		      Statement s = Connexion.getInstane().getConnection().createStatement();
		   int r = 0;
		     r = s.executeUpdate("UPDATE reservation SET valide='1' where log='"+hide4+"' and code='"+hide3+"'");
		               
		               	
		    			
		      		
		      			
		    if(r>0) {
		    	request.setAttribute("msge","votre message est bien envoyer");
		    	

		    }else {
		    	request.setAttribute("msge1","opération non executée réessayer svp!! !!");
		    }
		    request.getRequestDispatcher("conreserv.jsp").forward(request, response);
		    } catch (SQLException ex) {
		 ex.printStackTrace();
	}
	}
}
