package Controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connexion.Connexion;

/**
 * Servlet implementation class Servlet9
 */
@WebServlet("/Servlet9")
public class Servlet9 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet9() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    String admin;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//System.out.println(request.getAttribute("reda"));
		 admin=(String) request.getAttribute("reda");
		 request.getRequestDispatcher("reservation1.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 int r = 0;
		 
		String name=  request.getParameter("name");
        String emaill = request.getParameter("emaill");
        String prenom = request.getParameter("prenom");
        String dated = request.getParameter("dated");
        //String datef = request.getParameter("datef");
        String age = request.getParameter("age");
        String login = request.getParameter("logi");
         String heured = request.getParameter("heurd");
         String heuref = request.getParameter("heurf");
         System.out.println(heured);
         System.out.println(heuref);
         String StartTimes = heured;
         String EndTimes = heuref;
 		String startTimeParse[] = StartTimes.split(":");
 		String endTimeParse[] = EndTimes.split(":");
 		int firstHour = Integer.parseInt(startTimeParse[0]);
 		int firstMinute = Integer.parseInt(startTimeParse[1]);
 		int secondHour = Integer.parseInt(endTimeParse[0]);
 		int secondMinute = Integer.parseInt(endTimeParse[1]);
 		int durattionHour = secondHour - firstHour;
 		int durattionMinutes = secondMinute - firstMinute;
 		System.out.println("Duration : " +durattionHour+":"+durattionMinutes );
        System.out.println(admin);
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
   	Date date = new Date();
        try {
			Date date1 = sdf.parse(dated);
		  //  Date date2 = sdf.parse(datef);
		    System.out.println("date1 : " + sdf.format(date1));
	        //System.out.println("date2 : " + sdf.format(date2));
	       
	        System.out.println(login);
	        if (date1.compareTo(date) <  0) {
	        	System.out.println("dkhaaalt0 ");
	        	request.setAttribute("msg7","la date de reservation  est petite que d'aujourd'ui");
	        	request.getRequestDispatcher("reservation1.jsp").forward(request, response);
	            System.out.println("Date1 is after Date2");
	        } else if (date1.compareTo(date)>=  0) {
	        	System.out.println("dkhaaalt00001 ");
	        	if(durattionHour>=0) {
	        		try {
		        		System.out.println("dkhaaalt1 ");
		 	           
		                PrintWriter out = response.getWriter();
		               out.println("étape 1");
		                //Class.forName("com.mysql.cj.jdbc.Driver");
		                
		                //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion","root","");
		                //Statement s = con.createStatement();
		               Statement s = Connexion.getInstane().getConnection().createStatement();
		                //SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		            	//Date date = new Date();
		            	
		               
		            	System.out.println("dkhaaalt2 ");
		                            r = s.executeUpdate("INSERT INTO reservation (datedebut,datefin,datereservation,email_c,log,code,valide) VALUES ('"+heured+"','"+heuref+"','"+dated+"','"+emaill+"','"+login+"','"+admin+"','0')");
		                           
		                           	
		                            System.out.println("dkhaaalt3 ");			
		                           
		                            System.out.println("votre Reservation est biennnn etablie");
		                        	request.setAttribute("msg8","votre Reservation est bien etablie");
		                        	request.getRequestDispatcher("mesReservations.jsp").forward(request, response);
		               
		                } catch (SQLException e) {
		                	e.printStackTrace();
		            }
	
	        	}else {
	        		System.out.println("votre Reservation est mal etablie,veillez ressayer");
	            	request.setAttribute("msg7","l'heure de debut est petite ou egal à l'heure du fin !!");
	            	request.getRequestDispatcher("reservation1.jsp").forward(request, response);
	                		
	        	}
	        		        	
	        } 
	        

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       /* if(r>0) {
        	System.out.println("votre Reservation est biennnn etablie");
        	request.setAttribute("msg8","votre Reservation est bien etablie");
        	
        	request.getRequestDispatcher("reservation1.jsp").forward(request, response);
        }else {
        	System.out.println("votre Reservation est mal etablie,veillez ressayer");
        	request.setAttribute("msg7","votre Reservation est mal etablie,veillez ressayer!!");
        	request.getRequestDispatcher("reservation1.jsp").forward(request, response);
        }*/
	}

}
