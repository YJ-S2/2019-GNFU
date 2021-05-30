package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.UserManager;

public class LoginController implements Controller {
    @Override
    
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       Logger log = LoggerFactory.getLogger(LoginController.class);

    	String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		try {
			
			UserManager manager = UserManager.getInstance();
			manager.login(userId, password);
	        log.debug("로그인에서 userid : {}", userId);

			HttpSession session = request.getSession();
            session.setAttribute(UserSessionUtils.USER_SESSION_KEY, userId);

            
            return "/user/connecter";			
		} catch (Exception e) {
            request.setAttribute("loginFailed", true);
			request.setAttribute("exception", e);
            return "/user/loginForm.jsp";			
		}	
    }
}
