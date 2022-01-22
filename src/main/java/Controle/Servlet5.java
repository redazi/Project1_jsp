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

import connexion.Connexion;

/**
 * Servlet implementation class Servlet5
 */
@WebServlet("/Servlet5")
public class Servlet5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet5() {
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
		

		String mod=request.getParameter("mod");
		try {
			 PrintWriter out = response.getWriter();
			/* Class.forName("com.mysql.cj.jdbc.Driver");
	          
	          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion","root","");
	          Statement s = con.createStatement();*/
		      Statement s = Connexion.getInstane().getConnection().createStatement();
	          ResultSet r = s.executeQuery("select * from voiture where num_matricule='"+mod+"'");
	          
	         if (r.next()) {
	        	
                 request.setAttribute("error80","recuperation avec succes");
              	String matr=r.getString("num_matricule");
	          	String marqu=r.getString("marque");
	          	String model=r.getString("modele");
	          	String couleu=r.getString("couleur");
	          	String categori=r.getString("categorie");
	          	String puissanc=r.getString("puissance");
	          	String pri=r.getString("prix");
	        	String moto=r.getString("motorisation");
	        	String trans=r.getString("transmission");
	        	String amod=r.getString("amodele");
	        	
	          	 request.setAttribute("marqu",marqu);
	          	request.setAttribute("model",model);
	          	request.setAttribute("matr",matr);
	          	request.setAttribute("couleu",couleu);
	          	request.setAttribute("categori",categori);
	          	request.setAttribute("puissanc",puissanc);
	          	request.setAttribute("pri",pri);
	          	request.setAttribute("moto",moto);
	          	request.setAttribute("trans",trans);
	          	request.setAttribute("amod",amod);
                    
	                
	          	 request.getRequestDispatcher("modifierVoiture.jsp").forward(request, response);
           	
           	
	              }else {
	            	
	            	  request.setAttribute("error8","ce matricule n'existe pas");
	            	  //response.sendRedirect("modifierVoiture0.jsp");
	               	  request.getRequestDispatcher("modifierVoiture0.jsp").forward(request, response);
	              }
		}catch(SQLException e) {
			e.getStackTrace();
		}
		
			
		}
		
		
	}


