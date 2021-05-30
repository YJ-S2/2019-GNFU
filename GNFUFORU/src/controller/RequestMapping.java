package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.user.*;
import controller.userHis.MyReviewDeleteController;
import controller.userHis.MyReviewListController;
import controller.userHis.MyReviewUpdateController;
import controller.userHis.UpdateController;
import controller.userHis.ViewMyReviewDetailController;
import controller.disease.*;
import controller.gyn.*;
import controller.review.*;


public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
        mappings.put("/", new ForwardController("index.jsp"));
        mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp"));
        mappings.put("/user/login", new LoginController());
        mappings.put("/user/logout", new LogoutController());
        mappings.put("/user/view", new ViewUserController());
        mappings.put("/user/register/form", new ForwardController("/user/registerForm.jsp"));
        mappings.put("/user/register", new RegisterUserController());
       
        mappings.put("/user/update/form", new UpdateUserController());
        mappings.put("/user/update", new UpdateUserController());
        mappings.put("/user/delete", new DeleteUserController());
        
        //userhis mapping
        mappings.put("/user/connecter", new ForwardController("/disease/list.jsp" ));
        mappings.put("/user/his", new ForwardController("/history/MyPage.jsp" ));
        mappings.put("/userHis/info", new ForwardController("/history/MyInfoUpdate.jsp" ));
        mappings.put("/userHis/search", new SaveViewController());
        mappings.put("/userHis/reviewSearch", new MyReviewListController());
        mappings.put("/userHis/saveDelete", new DeleteSaveController());
        mappings.put("/userHis/Mydelete", new MyReviewDeleteController());
        mappings.put("/userHis/ReviewUpdate/form", new MyReviewUpdateController());
        mappings.put("/userHis/update", new UpdateController());
   
        
        //Review
        mappings.put("/review/list", new ListReviewController());
        mappings.put("/review/delete", new DeleteReviewController());
        mappings.put("/review/insert", new InsertReviewController());
        mappings.put("/review/view", new ViewReviewController());
        mappings.put("/review/detail", new ViewReviewDetailController());
        mappings.put("/review/backList", new ForwardController("/review/reviewlist.jsp"));
        mappings.put("/review/update/form", new SendUpdateController());
        mappings.put("/review/update", new UpdateReviewController());
        mappings.put("/review/Mydetail", new ViewMyReviewDetailController());
        
        //disease mapping
        mappings.put("/disease/search", new SearchController());
        mappings.put("/disSave/save", new SaveController());
        //gyn mapping
        mappings.put("/gyn/detail", new GynDetailViewController());
        mappings.put("/gyn/list", new GynSearchController());
        mappings.put("/gyn/view", new ForwardController("/gyn/view.jsp"));
     
        
        logger.info("Initialized Request Mapping!");

      

    }

    public Controller findController(String uri) {	
        return mappings.get(uri);
    }
}
