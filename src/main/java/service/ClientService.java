package service;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Client;
import beans.Salle;
import connexion.Connexion;
import dao.IDao;

public class ClientService implements IDao<Client>{

	@Override
	public boolean create(Client o) {
		 String sql = "insert into auth values (?, ?,null)";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setString(1, o.getLogin());
	            ps.setString(2, o.getPassword());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();

	        }
	        return false;
	}

	@Override
	public boolean delete(Client o) {
		 String sql = "delete from auth where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, o.getId());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("delete : erreur sql : " + e.getMessage());

	        }
	        return false;
	}
	public Client findBylogin(String code) {
		 Client m = null;
	        String sql = "select * from auth where login  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setString(1, code);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                return new Client(rs.getInt("id"), rs.getString("login"), rs.getString("password"));
	            }

	        } catch (SQLException e) {
	            System.out.println("findBycode " + e.getMessage());
	        }
	        return null;
	}
	@Override
	public boolean update(Client o) {
		String sql = "update auth set password  = ?  where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, o.getPassword());
            ps.setInt(2, o.getId());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("update : erreur sql : " + e.getMessage());

        }
        return false;
	}

	@Override
	public Client findById(int id) {
		 Client m = null;
	        String sql = "select * from auth where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                return new Client(rs.getInt("id"), rs.getString("login"), rs.getString("password"));
	            }

	        } catch (SQLException e) {
	            System.out.println("findById " + e.getMessage());
	        }
	        return null;
	}

	@Override
	public List<Client> findAll() {
		 List<Client> clients = new ArrayList<Client>();

	        String sql = "select * from auth";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                clients.add(new Client(rs.getInt("id"), rs.getString("login"), rs.getString("password")));
	            }

	        } catch (SQLException e) {
	            System.out.println("findAll " + e.getMessage());
	        }
	        return clients;
	}

}
