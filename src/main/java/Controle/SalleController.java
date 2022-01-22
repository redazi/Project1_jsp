package Controle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Salle;
import service.SalleService;

/**
 * Servlet implementation class SalleController
 */
@WebServlet("/SalleController")
public class SalleController extends HttpServlet {
	
		private static final long serialVersionUID = 1L;
		SalleService cs = new SalleService();
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
		
	    public SalleController() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

		 if (request.getParameter("op") != null) {
				 // System.out.println("lawlaaaa");
		            if (request.getParameter("op").equals("load")) {
		        	//	System.out.println("lawlaaaa 222222222");
						 List<Salle> salles1 = cs.findAll();
				         for(Salle c : salles1) {
				         	//c.toString();
				        	
				         	System.out.println(c.toString());
				         }
					
		                response.setContentType("application/json");
		                List<Salle> salles = cs.findAll();
		                
		                Gson json = new Gson();
		            	System.out.println("taaniaaaaa");
		       		 
		                for(Salle c : salles) {
		                	//c.toString();
		                	System.out.println(c.toString());
		                }
		       	
		                response.getWriter().write(json.toJson(salles));
		            }else if(request.getParameter("op").equals("delete")){
		                int id = Integer.parseInt(request.getParameter("id"));
		                cs.delete(cs.findById(id));
		                response.setContentType("application/json");
		                List<Salle> salles = cs.findAll();
		                Gson json = new Gson();
		                response.getWriter().write(json.toJson(salles));
		                
		            }else if(request.getParameter("op").equals("update")){
		                int id = Integer.parseInt(request.getParameter("id"));
		               Salle o =  cs.findById(id);
		                String code = request.getParameter("code");
		                String libelle = request.getParameter("libelle");
		                o.setCode(code);
		                o.setLibelle(libelle);
		               
		              cs.update(o);
		              response.setContentType("application/json");
		               List<Salle> salles = cs.findAll();
		                Gson json = new Gson();
		                response.getWriter().write(json.toJson(salles));
		            }
		        } else {
		            String code = request.getParameter("code");
		            String libelle = request.getParameter("libelle");
		            System.out.println(code);
		            System.out.println(libelle);
		            cs.create(new Salle(code, libelle));
		            response.setContentType("application/json");
		            List<Salle> salles = cs.findAll();
		            Gson json = new Gson();
		            response.getWriter().write(json.toJson(salles));
		}
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
			processRequest(request, response);
			
			//doGet(request, response);
		}

	}
