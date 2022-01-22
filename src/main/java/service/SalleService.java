package service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Client;
import beans.Salle;
import connexion.Connexion;
import dao.IDao;

public class SalleService implements IDao<Salle> {

	@Override
	public boolean create(Salle o) {
		System.out.println("testyyyyyyyyyyyy");
		
		System.out.println(o.getCode());
		System.out.println(o.getLibelle());
		String sql = "insert into salle values (null,?, ?)";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            
            ps.setString(1, o.getCode());
            ps.setString(2, o.getLibelle());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return false;
	}

	@Override
	public boolean delete(Salle o) {
		 String sql = "delete from salle where id  = ?";
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

	@Override
	public boolean update(Salle o) {
		String sql = "update salle set code  = ?,libelle  = ?  where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, o.getCode());
            ps.setString(2, o.getLibelle());
            ps.setInt(3, o.getId());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("update : erreur sql : " + e.getMessage());

        }
        return false;
	}

	@Override
	public Salle findById(int id) {
		 Client m = null;
	        String sql = "select * from salle where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                return new Salle(rs.getInt("id"), rs.getString("code"), rs.getString("libelle"));
	            }

	        } catch (SQLException e) {
	            System.out.println("findById " + e.getMessage());
	        }
	        return null;
	}
	public Salle findBycode(String code) {
		 Client m = null;
	        String sql = "select * from salle where code  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setString(1, code);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                return new Salle(rs.getInt("id"), rs.getString("code"), rs.getString("libelle"));
	            }

	        } catch (SQLException e) {
	            System.out.println("findBycode " + e.getMessage());
	        }
	        return null;
	}

	@Override
	public List<Salle> findAll() {
		 List<Salle> salles = new ArrayList<Salle>();

	        String sql = "select * from salle";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                salles.add(new Salle(rs.getInt("id"), rs.getString("code"), rs.getString("libelle")));
	            }

	        } catch (SQLException e) {
	            System.out.println("findAll " + e.getMessage());
	        }
	        return salles;
	}
	

}
