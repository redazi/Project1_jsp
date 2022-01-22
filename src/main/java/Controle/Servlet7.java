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
 * Servlet implementation class Servlet7
 */
@WebServlet("/Servlet7")
public class Servlet7 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet7() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		/*try {
	           
            PrintWriter out = response.getWriter();
           
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion","root","");
            Statement s = con.createStatement();
          
            int r = 0;
            out.println("vrrrrrr");
			out.println("vrrrrrrrrr");
                        r = s.executeUpdate("INSERT INTO contact (nom,email,phone,message) VALUES ('frfr','zafzefze','044255','zeezffzefzef')");
                       
                       	
            			out.println("verrrrr22222");
            			out.println("666666666666666666");
              		
              			
            if(r>0) {
            	request.setAttribute("msg","votre message est bien envoyer");
            	
        
            }else {
            	request.setAttribute("msg","votre message non envoyer,veillez réessayer svp!!");
            }
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            } catch (SQLException | ClassNotFoundException ex) {
         ex.getStackTrace();
        }*/
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nom=  request.getParameter("nom");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String msg = request.getParameter("msg");
 
		try {
	           
            PrintWriter out = response.getWriter();
           /*
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion","root","");
            Statement s = con.createStatement();*/
            Statement s = Connexion.getInstane().getConnection().createStatement();
            int r = 0;
            System.out.println(nom);
            System.out.println(email);
            System.out.println(phone);
            System.out.println(msg);
                        r = s.executeUpdate("INSERT INTO contact (email,message,nom,phone) VALUES ('"+email+"','"+msg+"','"+nom+"','"+phone+"')");
                       
                       	
            			
              		
              			
            if(r>0) {
            	request.setAttribute("msg","votre message est bien envoyer");
            	
        
            }else {
            	request.setAttribute("msg1","votre message non envoyer,veillez réessayer svp!!");
            }
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            } catch (SQLException ex) {
         ex.printStackTrace();
        }
	}
	}

