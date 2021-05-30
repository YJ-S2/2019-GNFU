package controller.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.dao.ReviewDAO;
import model.Review;
public class DeleteReviewController implements Controller{
	   private static final Logger log = LoggerFactory.getLogger(DeleteReviewController.class);
	  private Review delete;
	    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
	    	String userId = UserSessionUtils.getLoginUserId(request.getSession());
	    	ReviewDAO manager = ReviewDAO.getInstance();
	
	    	String deleteId = request.getParameter("revId");
	    	try {
	    		delete = new Review(
	    				deleteId,
	    				userId);

	    	log.debug("Delete Reivew : {}", deleteId);
	    	
			manager.remove(delete);
				
		   	String gynId = request.getParameter("getgynId");
		   	List<Review> reviewList = manager.findReviewList(gynId);
			request.setAttribute("reviewList", reviewList);
			return "/review/reviewlist.jsp";
	    	}
	    	 catch (Exception e) { 		
	    		 
	 			return "/review/reviewlist.jsp";
	 		}
	    }
}
		