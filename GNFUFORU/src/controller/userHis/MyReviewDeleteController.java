package controller.userHis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.dao.ReviewDAO;
import model.Review;
public class MyReviewDeleteController implements Controller{
	   private static final Logger log = LoggerFactory.getLogger(MyReviewDeleteController.class);
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
		      
			return "/history/MyPage.jsp";
	    	}
	    	 catch (Exception e) { 		
	    		 
	 			return "/review/reviewlist.jsp";
	 		}
	    }
}
		