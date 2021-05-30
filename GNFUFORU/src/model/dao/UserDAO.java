package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;


public class UserDAO {
	private JDBCUtil jdbcUtil = null;
	
	public UserDAO() {			
		jdbcUtil = new JDBCUtil();
	}
	
	public int create(User user) throws SQLException {
		String sql = "INSERT INTO USERINFO VALUES (?, ?, ?, ?, ?)";		
		Object[] param = new Object[] {user.getUserId(), user.getPassword(), 
						user.getName(), user.getPhone(), user.getEmail()};				
		jdbcUtil.setSqlAndParameters(sql, param);
						
		try {				
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	
		}		
		return 0;			
	}


	public int update(User user) throws SQLException {
		String sql = "UPDATE USERINFO "
					+ "SET user_pwd=?, user_phone=?, user_email=? "
					+ "WHERE user_id=?";
		Object[] param = new Object[] {user.getPassword(), user.getPhone(), 
				user.getEmail(), user.getUserId()};		
		
		jdbcUtil.setSqlAndParameters(sql, param);	
			
		try {				
			int result = jdbcUtil.executeUpdate();	
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	
		}		
		return 0;
	}


	public int remove(String userId) throws SQLException {
		String sql = "DELETE FROM USERINFO WHERE user_id=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	

		try {				
			int result = jdbcUtil.executeUpdate();	
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	
		}		
		return 0;
	}


	public boolean existingUser(String userId) throws SQLException {
		String sql = "SELECT count(*) FROM USERINFO WHERE user_id=?";      
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	

		try {
			ResultSet rs = jdbcUtil.executeQuery();	
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return false;
	}
	
	public User findUser(String userId) throws SQLException {
        String sql = "SELECT user_pwd, user_name, user_phone, user_email "
        			+ "FROM USERINFO "
        			+ "WHERE user_id=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	
		try {
			ResultSet rs = jdbcUtil.executeQuery();		
			if (rs.next()) {						
				User user = new User(		
					userId,
					rs.getString("user_pwd"),
					rs.getString("user_name"),
					rs.getString("user_phone"),
					rs.getString("user_email"));
				return user;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}
}
