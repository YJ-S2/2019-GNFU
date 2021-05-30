package controller.userHis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Review;
import model.dao.ReviewDAO;

public class MyReviewUpdateController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(MyReviewUpdateController.class);

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String user_t_Id = UserSessionUtils.getLoginUserId(request.getSession());
        log.debug("User id : {}", user_t_Id);
		String gynId = request.getParameter("getgynId");
		String reviewId = request.getParameter("revId");
		
		log.debug("���������Ʈ�� �Ѿ�� : {}", reviewId);
		log.debug("���������Ʈ�� �Ѿ�� : {}", gynId);
		
		ReviewDAO manager = ReviewDAO.getInstance();
		Review updateReview = manager.findReview(reviewId);
		
		log.debug("������Ʈ : {}", updateReview);

		
		request.setAttribute("review", updateReview);			

	    return "/history/MyReviewUpdateForm.jsp";
        
	}
}
