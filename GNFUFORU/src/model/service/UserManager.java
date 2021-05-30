package model.service;

import java.sql.SQLException;
import java.util.List;

import model.User;

import model.dao.UserDAO;
import model.dao.ReviewDAO;

public class UserManager {
	private static UserManager userMan = new UserManager();
	private UserDAO userDAO;

	private ReviewDAO reviewDAO;

	private UserManager() {
		try {
			userDAO = new UserDAO();
			// commDAO = new CommunityDAO();
			// userAanlysis = new UserAnalysis(userDAO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static UserManager getInstance() {
		return userMan;
	}

	public int create(User user) throws SQLException, ExistingUserException {
		if (userDAO.existingUser(user.getUserId()) == true) {
			throw new ExistingUserException(user.getUserId() + "이미 존재하는 아이디 입니다.");
		}
		return userDAO.create(user);
	}

	public int update(User user) throws SQLException, UserNotFoundException {

		return userDAO.update(user);
	}

	public int remove(String userId) throws SQLException, UserNotFoundException {

		return userDAO.remove(userId);
	}

	public User findUser(String userId) throws SQLException, UserNotFoundException {
		User user = userDAO.findUser(userId);

		if (user == null) {
			throw new UserNotFoundException(userId + "찾을 수 없는 사용자 입니다.");
		}
		return user;
	}

	public boolean login(String userId, String password)
			throws SQLException, UserNotFoundException, PasswordMismatchException {
		User user = findUser(userId);

		if (!user.matchPassword(password)) {
			throw new PasswordMismatchException("비밀번호가 일치하지 않습니다.");
		}
		return true;
	}
	public UserDAO getUserDAO() {
		return this.userDAO;
	}
}