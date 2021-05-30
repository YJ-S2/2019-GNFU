package controller.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Review;
import model.dao.ReviewDAO;

public class InsertReviewController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(InsertReviewController.class);
	private Review review;
	private List<Review> reviewList;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String user_t_Id = UserSessionUtils.getLoginUserId(request.getSession());
        log.debug("User id : {}", user_t_Id);
		String gyn_id = request.getParameter("gynId");

		try {
		review = new Review(
				user_t_Id, 
				gyn_id, 
				"",
				Integer.parseInt(request.getParameter("grade")), 
				null, 
				request.getParameter("content"));

		log.debug("Insert Review : {}", review);
		log.debug("gyn_id : {}", gyn_id);
		ReviewDAO reviewDAO = new ReviewDAO();
		reviewDAO.create(review);
		
		reviewList = reviewDAO.findReviewList(gyn_id);
		
		request.setAttribute("reviewList", reviewList);
		
		
		return "/review/reviewlist.jsp";
		
		} catch (Exception e) {
			return "/reveiw/exception.jsp";
		}
	}
}