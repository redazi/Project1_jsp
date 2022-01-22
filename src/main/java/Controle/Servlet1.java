package Controle;
import connexion.*;
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
import connexion.*;
/**
 * Servlet implementation class Servlet1
 */
@WebServlet("/Servlet1")
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet1() {
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
	
		try {
	           
            PrintWriter out = response.getWriter();
            System.out.println("564654654");
            //Class.forName("com.mysql.cj.jdbc.Driver");
            
            //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion","root","");
            System.out.println("fveveveveve");
            Statement s = Connexion.getInstane().getConnection().createStatement();
            String l=  request.getParameter("login1");
            String p = request.getParameter("pass");
            out.println(l);
            out.println(p);
            ResultSet r = s.executeQuery("select * from auth where login='"+l+"' and password='"+p+"' ");
           if (r.next()) {
              
              request.setAttribute("hello",l);
              HttpSession session = request.getSession();
              session.setAttribute("hello", l);
              request.getRequestDispatcher("home.jsp").forward(request, response);  
              
                   
                }else{
                	 request.setAttribute("error1","votre login ou mot de passe est incorecte");
                	 request.getRequestDispatcher("login.jsp").forward(request, response);             
                    
                }
                
            
            } catch (SQLException ex) {
         ex.getStackTrace();
        }
}
	
	}


