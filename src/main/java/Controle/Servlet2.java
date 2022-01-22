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
 * Servlet implementation class Servlet2
 */
@WebServlet("/Servlet2")
public class Servlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet2() {
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
		try {
	           
            PrintWriter out = response.getWriter();
           
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gsalle?serverTimezone=UTC","root","");
            
            Statement s = con.createStatement();
            String l=  request.getParameter("user");
            
            String pa = request.getParameter("passw");
            out.println(l);
      
            ResultSet r = s.executeQuery("select * from auth where login='"+l+"' ");
            
           if (r.next()) {
        	  request.setAttribute("error3","ce nom existe deja");
        	  request.getRequestDispatcher("sign-up.jsp").forward(request, response);
                   
                }else{
                	if(l.length()>3) {
                		 if(request.getParameter("passw").length()>7){
                    		   
                    		   if(request.getParameter("passw").equals(request.getParameter("cpassw"))) {
                    			 String query = "INSERT INTO auth (login, password) VALUES (?, ?)";
                               PreparedStatement preparedStmt = con.prepareStatement(query);
                               preparedStmt.setString(1,l);
                               preparedStmt.setString(2,pa);
                               preparedStmt.executeUpdate();
                               request.setAttribute("test","ok");
                               
                               
                               HttpSession session = request.getSession();

                               session.setAttribute("nom", l);
                               request.setAttribute("error14","Utilisateur est bien ajouté");
                               request.getRequestDispatcher("login.jsp").forward(request, response);
                              
                    		   }else {
                    			   
                    			 request.setAttribute("error5","les deux mot de passe sont pas identiques");
                            	  
                    			request.getRequestDispatcher("signup.jsp").forward(request, response);
                    		   }
                    		   
                    		   
                    	   }else {
                    		   
                    		 request.setAttribute("error4","votre mot de passe faut dépassé 7 caractere");
                     	  request.getRequestDispatcher("signup.jsp").forward(request, response);
                    	   }	            
                	}else {
                		request.setAttribute("error3","le nom doit depasser 3 caractére");
                  	  request.getRequestDispatcher("signup.jsp").forward(request, response);
                             
                	}
                	
                	     
                    
                }
                
            
            } catch (SQLException | ClassNotFoundException ex) {
         ex.getStackTrace();
        }
		
	}

}
