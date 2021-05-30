package controller.userHis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Review;
import model.dao.ReviewDAO;

public class UpdateController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(UpdateController.class);
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String user_t_Id = UserSessionUtils.getLoginUserId(request.getSession());
        log.debug("User id : {}", user_t_Id);
        
		String gynId = request.getParameter("getgynId");
		String reviewId = request.getParameter("revId");
		
		ReviewDAO manager = ReviewDAO.getInstance();	
		Review updateReview = manager.findReview(reviewId);
		request.setAttribute("review", updateReview);

		log.debug("업데이트컨트롤러로 넘어갔음 : {}", reviewId);
		log.debug("업데이트컨트롤러로 넘어갔음 : {}", gynId);
		
		updateReview = new Review(
    			request.getParameter("revId"),
        		request.getParameter("gynId"),
        		user_t_Id,
        		Integer.parseInt(request.getParameter("grade")),
        		request.getParameter("content"));
    	
    	log.debug("Update Review : {}", updateReview);
    	
    	manager = ReviewDAO.getInstance();
    	manager.update(updateReview);

        return "/history/MyPage.jsp";      
	}

}
