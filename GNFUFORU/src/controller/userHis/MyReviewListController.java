package controller.userHis;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import controller.Controller;
import model.Review;
import model.dao.ReviewDAO;

public class MyReviewListController implements Controller{
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub
      
         ReviewDAO reviewDAO = ReviewDAO.getInstance();
         String userId = request.getParameter("userId");
         
         List<Review> ureviewList = reviewDAO.findMyReviewList(userId);
         request.setAttribute("ureviewList", ureviewList);         

      return "/history/MyReview.jsp";        
   }   
}