package model.dao;

import java.sql.*;
import java.util.*;
import java.util.Date;
import java.text.SimpleDateFormat;

import model.Review;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ReviewDAO {

	private JDBCUtil jdbcUtil = null;
	private static ReviewDAO reviewDAO = new ReviewDAO();
	private static final Logger log = LoggerFactory.getLogger(ReviewDAO.class);

	public ReviewDAO() {
		jdbcUtil = new JDBCUtil();
	}

	public static ReviewDAO getInstance() {
		return reviewDAO;
	}

	public Review create(Review review) throws SQLException {
		String sql = "INSERT INTO GYN_REV VALUES (?, ?, rev_seq.nextVal, ?, SYSDATE, ?)";
		Object[] param = new Object[] { review.getUserId(), review.getGynId(), review.getGrade(), review.getContent() };

		jdbcUtil.setSqlAndParameters(sql, param);

		String key[] = { "gyn_rev_id" };

		try {
			jdbcUtil.executeUpdate(key);
			ResultSet rs = jdbcUtil.getGeneratedKeys();
			if (rs.next()) {
				String generatedKey = rs.getString(1);
				review.setRevId(generatedKey);
			}
			return review;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}

		return null;
	}

	public int update(Review review) throws SQLException {
		String sql = "UPDATE GYN_REV " + "SET gyn_grade=?, gyn_review_date=SYSDATE, gyn_review=? "
				+ "WHERE gyn_rev_id=? AND user_id=? ";

		Object[] param = new Object[] { review.getGrade(), review.getContent(), review.getRevId(), review.getUserId() };
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

	public int remove(Review review) throws SQLException {
		String sql = "DELETE FROM GYN_REV WHERE gyn_rev_id=? AND user_id=? ";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { review.getRevId(), review.getUserId() });

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

	public Review findReview(String revId) throws SQLException {
		String sql = "SELECT * " + "FROM GYN_REV r join GYN g " + "on r.gyn_id = g.gyn_id " + "WHERE GYN_REV_ID=? ";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { revId });

		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while (rs.next()) {
				Review review = new Review(rs.getString("user_id"), rs.getString("gyn_id"), revId,
						rs.getInt("gyn_grade"), rs.getDate("gyn_review_date"), rs.getString("gyn_review"),
						rs.getString("gyn_name"));
				return review;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		return null;
	}

	public List<Review> findReviewList(String gynId) throws SQLException {
		String sql = "SELECT * " + "FROM GYN_REV r join GYN g " + "on r.gyn_id = g.gyn_id " + "WHERE r.GYN_ID=? ";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { gynId });

		try {
			ResultSet rs = jdbcUtil.executeQuery();
			List<Review> reviewList = new ArrayList<Review>();
			while (rs.next()) {

				log.debug("reivewlist Searching... : {}");
				log.debug("gynid{}", gynId);

				Review review = new Review(rs.getString("USER_ID"), rs.getString("GYN_ID"), rs.getString("GYN_REV_ID"),
						rs.getInt("GYN_GRADE"), rs.getDate("GYN_REVIEW_DATE"), rs.getString("GYN_REVIEW"),
						rs.getString("GYN_NAME"));
				reviewList.add(review);
			}
			return reviewList;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		return null;
	}

	public List<Review> findMyReviewList(String userId) throws SQLException {
		String sql = "SELECT * " + "FROM GYN_REV r join GYN g " + "on r.gyn_id = g.gyn_id " + "WHERE r.USER_ID=?  ";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { userId });

		try {
			ResultSet rs = jdbcUtil.executeQuery();
			List<Review> reviewList = new ArrayList<Review>();
			while (rs.next()) {
				log.debug("userReview Searching... : {}");

				Review ureview = new Review(userId, rs.getString("gyn_id"), rs.getString("gyn_rev_id"),
						rs.getInt("gyn_grade"), rs.getDate("gyn_review_date"), rs.getString("gyn_review"),
						rs.getString("gyn_name"));
				reviewList.add(ureview);
			}
			return reviewList;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		return null;
	}

}