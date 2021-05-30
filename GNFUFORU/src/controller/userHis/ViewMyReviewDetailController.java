package controller.userHis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Review;

import model.dao.ReviewDAO;

public class ViewMyReviewDetailController implements Controller {

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

		return "/history/MyReviewDetail.jsp";

	}
}