package controller.user;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.UserManager;
import model.User;

public class UpdateUserController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
 
    	if (request.getMethod().equals("GET")) {	
    		String updateId = request.getParameter("userId");

    		log.debug("UpdateForm Request : {}", updateId);
    		
    		UserManager manager = UserManager.getInstance();
			User user = manager.findUser(updateId);	
			request.setAttribute("user", user);			
			
			System.out.println("QQQQ" + user);
			
			HttpSession session = request.getSession();
			if (UserSessionUtils.isLoginUser(updateId, session))
			{					
				return "/history/UpdateForm.jsp"; 
			}    
			
			request.setAttribute("updateFailed", true);		   
			return "/history/MyPage.jsp";	
	    }	
    	
    	User updateUser = new User(
    			request.getParameter("userId"),
        		request.getParameter("password"),
        		request.getParameter("name"),
        		request.getParameter("phone"),
        		request.getParameter("email"));
    	
    	log.debug("Update User : {}", updateUser);

		UserManager manager = UserManager.getInstance();
		manager.update(updateUser);			
        return "redirect:/user/his";			
    }
}
