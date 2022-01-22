package Controle;

import java.io.IOException;
//import java.io.PrintWriter;
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
 * Servlet implementation class Servlet6
 */
@WebServlet("/Servlet6")
public class Servlet6 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet6() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String matricule8=request.getParameter("matricule1");
		
		request.setAttribute("ii",matricule8);
		
		// TODO Auto-generated method stub
/*	response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
			 PrintWriter out = response.getWriter();
			 Class.forName("com.mysql.cj.jdbc.Driver");
	          
	          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion","root","");
	          Statement s = con.createStatement();
	         
	          out.println("voituuure prepaareerr");
	         s.execute("UPDATE voiture SET num_matricule='rz7dddd',marque='rrrrr',modele='refregre',couleur='gergegre',categorie='gggggg',puissance='grereg',prix='2877',motorisation='dede',transmission='dede',amodele='dedede' WHERE num_matricule='rz7' ");
	        out.println("voituuure modifierrr");
	       // request.setAttribute("test3","voiture modifierr");
	   		 //request.getRequestDispatcher("modifierVoiture.jsp").forward(request, response);
	        
		}catch(SQLException | ClassNotFoundException e) {
			e.getStackTrace();
		}*/
		 //PrintWriter out = response.getWriter();
		//out.println(request.getAttribute("matr"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String matricule1=request.getParameter("matricule1");
		String modele1=request.getParameter("modele1");
		String puissance1=request.getParameter("puissance1");
		String couleur1=request.getParameter("couleur1");
		String categorie1=request.getParameter("categorie1");
		String prix1=request.getParameter("prix1");
		String marque1=request.getParameter("marque1");
		String moto1=request.getParameter("motorisation1");
		String transmision1=request.getParameter("transmission1");
		String Amodele1=request.getParameter("Amodele1");
		System.out.println(matricule1);
		int r =0;
		try {
			// PrintWriter out = response.getWriter();
			/* Class.forName("com.mysql.cj.jdbc.Driver");
	          
	          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion","root","");
	          Statement s = con.createStatement();*/
		      Statement s = Connexion.getInstane().getConnection().createStatement();
	         r =  s.executeUpdate("UPDATE voiture SET num_matricule='"+matricule1+"',marque='"+marque1+"',modele='"+modele1+"',couleur='"+couleur1+"',categorie='"+categorie1+"',puissance='"+puissance1+"',prix='"+prix1+"',motorisation='"+moto1+"',transmission='"+transmision1+"',amodele='"+Amodele1+"' WHERE num_matricule='"+matricule1+"' ");
	          System.out.println(modele1);
	  		System.out.println(puissance1);
	  		System.out.println(couleur1);
	  		System.out.println(prix1);
	  		System.out.println(moto1);
	  		System.out.println(transmision1);
	  		System.out.println(Amodele1);
	        
	        request.setAttribute("test3","voiture modifier avec succes");
	   		 request.getRequestDispatcher("modifierVoiture0.jsp").forward(request, response);
	        
		}catch(SQLException e) {
			e.getStackTrace();
		}
		
		if(r==0) {
			request.setAttribute("test3","voiture non  modifier");
	   		 request.getRequestDispatcher("modifierVoiture.jsp").forward(request, response);
		}
		
	}

}
