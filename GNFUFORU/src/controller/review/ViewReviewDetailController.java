package controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Review;

import model.dao.ReviewDAO;

public class ViewReviewDetailController implements Controller {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ReviewDAO revdao = ReviewDAO.getInstance();

		String revId = request.getParameter("revId");

		Review rev = null;
		try {
			rev = revdao.findReview(revId); 
		} catch (Exception e) {
			return "/review/exception.jsp";
		}

		request.setAttribute("review", rev);

		return "/review/detail.jsp";

	}
}