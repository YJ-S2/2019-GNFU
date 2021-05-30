package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.UserHis;


public class UserHisDAO{
	private static UserHisDAO his = new UserHisDAO();
	private JDBCUtil jdbcUtil = null;

	public UserHisDAO() {

		jdbcUtil = new JDBCUtil();

	}
	
	public static UserHisDAO getInstance() {
		return his;
	}

	public int create(UserHis history) throws SQLException {
		String sql = "INSERT INTO USER_HIS VALUES (?, ?, ?)";
		Object[] param = new Object[] { history.getUserId(), history.getHisId(), history.getGynRevId() };
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

	public int update(UserHis history) throws SQLException {
		String sql = "UPDATE USERINFO " + "SET gyn_rev_id=?, his_id=? " + "WHERE user_T_id=?"; 

		Object[] param = new Object[] { history.getHisId(), history.getGynRevId(), history.getUserId() };
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

	public int remove(String his_id) throws SQLException {

		String sql = "DELETE FROM USER_HIS  WHERE user_his_id=? OR gyn_rev_id=? ";

		jdbcUtil.setSqlAndParameters(sql, new Object[] {}); 

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
	public List<UserHis> HistoryList(int currentPage, int countPerPage) throws SQLException {
		String sql = "SELECT gyn_rev_id, his_id, user_T_id " 
					+ "FROM USER_HIS ";
		jdbcUtil.setSqlAndParameters(sql, null,					
				ResultSet.TYPE_SCROLL_INSENSITIVE,				
				ResultSet.CONCUR_READ_ONLY);						
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();						
			int start = ((currentPage-1) * countPerPage) + 1;	
			if ((start >= 0) && rs.absolute(start)) {			
				List<UserHis> hisList = new ArrayList<UserHis>();	
				do {
					UserHis his = new UserHis(			
						rs.getString("his_id"),
						rs.getString("gyn_rev_id"),
						rs.getString("user_T_id"));
					
					hisList.add(his);							
				} while ((rs.next()) && (--countPerPage > 0));		
				return hisList;							
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}
	
	
	public List<UserHis> GynList(int currentPage, int countPerPage) throws SQLException {
		String sql = "SELECT gyn_rev_id, his_id, user_T_id " 
					+ "FROM USER_HIS  ";
		jdbcUtil.setSqlAndParameters(sql, null,					
				ResultSet.TYPE_SCROLL_INSENSITIVE,				
				ResultSet.CONCUR_READ_ONLY);						
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();						
			int start = ((currentPage-1) * countPerPage) + 1;	
			if ((start >= 0) && rs.absolute(start)) {			
				List<UserHis> hisList = new ArrayList<UserHis>();	
				do {
					UserHis his = new UserHis(			
						rs.getString("his_id"),
						rs.getString("gyn_rev_id"),
						rs.getString("user_T_id"));
					
					hisList.add(his);							
				} while ((rs.next()) && (--countPerPage > 0));		
				return hisList;							
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}

	
}