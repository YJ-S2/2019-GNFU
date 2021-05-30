package controller.review;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import model.Review;
import model.dao.ReviewDAO;

public class ListReviewController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(ListReviewController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	   	ReviewDAO reviewDAO = ReviewDAO.getInstance();
	   	String gynId = request.getParameter("getgynId");
	   	
	   	List<Review> reviewList = reviewDAO.findReviewList(gynId);
		request.setAttribute("reviewList", reviewList);			
		log.debug("Review list : {}", reviewList);

		return "/review/reviewlist.jsp";        
	}	
}
