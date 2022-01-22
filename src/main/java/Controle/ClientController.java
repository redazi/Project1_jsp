package Controle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Client;
import service.ClientService;

/**
 * Servlet implementation class ClientController
 */
@WebServlet("/ClientController")
public class ClientController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       ClientService cs = new ClientService();
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

	 if (request.getParameter("op") != null) {
			 // System.out.println("lawlaaaa");
	            if (request.getParameter("op").equals("load")) {
	        	//	System.out.println("lawlaaaa 222222222");
					 List<Client> clients1 = cs.findAll();
			         for(Client c : clients1) {
			         	//c.toString();
			        	
			         	System.out.println(c.toString());
			         }
				
	                response.setContentType("application/json");
	                List<Client> clients = cs.findAll();
	                
	                Gson json = new Gson();
	            	System.out.println("taaniaaaaa");
	       		 
	                for(Client c : clients) {
	                	//c.toString();
	                	System.out.println(c.toString());
	                }
	       	
	                response.getWriter().write(json.toJson(clients));
	            }else if(request.getParameter("op").equals("delete")){
	                int id = Integer.parseInt(request.getParameter("id"));
	                cs.delete(cs.findById(id));
	                response.setContentType("application/json");
	                List<Client> clients = cs.findAll();
	                Gson json = new Gson();
	                response.getWriter().write(json.toJson(clients));
	                
	            }else if(request.getParameter("op").equals("update")){
	                int id = Integer.parseInt(request.getParameter("id"));
	               Client o =  cs.findById(id);
	                String login = request.getParameter("login");
	                String passe = request.getParameter("passe");
	               o.setLogin(login);
	               o.setPassword(passe);
	 
	              cs.update(o);
	              response.setContentType("application/json");
	               List<Client> clients = cs.findAll();
	                Gson json = new Gson();
	                response.getWriter().write(json.toJson(clients));
	            }
	        } else {
	            String login = request.getParameter("login");
	            String passe = request.getParameter("passe");
	            cs.create(new Client(login, passe));
	            response.setContentType("application/json");
	            List<Client> clients = cs.findAll();
	            Gson json = new Gson();
	            response.getWriter().write(json.toJson(clients));
	}
	}
      
        

    

    public ClientController() {
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
		/*doGet(request, response);
		  if (request.getParameter("op") != null) {
			  System.out.println("lawlaaaa");
	            if (request.getParameter("op").equals("load")) {
	        		System.out.println("lawlaaaa 222222222");
					 List<Client> clients1 = cs.findAll();
			         for(Client c : clients1) {
			         	//c.toString();
			         	System.out.println(c.toString());
			         }
				
	                response.setContentType("application/json");
	                List<Client> clients = cs.findAll();
	                
	                Gson json = new Gson();
	            	System.out.println("taaniaaaaa");
	       		 
	                for(Client c : clients) {
	                	//c.toString();
	                	System.out.println(c.toString());
	                }
	       	
	                response.getWriter().write(json.toJson(clients));
	            }else if(request.getParameter("op").equals("delete")){
	                int id = Integer.parseInt(request.getParameter("id"));
	                cs.delete(cs.findById(id));
	                response.setContentType("application/json");
	                List<Client> clients = cs.findAll();
	                Gson json = new Gson();
	                response.getWriter().write(json.toJson(clients));
	                
	            }else if(request.getParameter("op").equals("update")){
	                int id = Integer.parseInt(request.getParameter("id"));
	               Client o =  cs.findById(id);
	                String login = request.getParameter("login");
	                String passe = request.getParameter("passe");
	               o.setLogin(login);
	               o.setPassword(passe);
	 
	              cs.update(o);
	              response.setContentType("application/json");
	               List<Client> clients = cs.findAll();
	                Gson json = new Gson();
	                response.getWriter().write(json.toJson(clients));
	            }
	        } else {
	            String login = request.getParameter("login");
	            String passe = request.getParameter("passe");
	            cs.create(new Client(login, passe));
	            response.setContentType("application/json");
	            List<Client> clients = cs.findAll();
	            Gson json = new Gson();
	            response.getWriter().write(json.toJson(clients));
	}*/
		processRequest(request, response);
	}
}
