package controller.gyn;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Gyn;
import model.dao.GynDAO;


public class GynSearchController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(GynSearchController.class);
    private String univId;
    private List<Gyn> gynList;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

       univId = request.getParameter("uni_id");
      
        log.debug("Gyn Search code : {}", univId);

      try {
    	  
         GynDAO gynDAO = GynDAO.getInstance();
         gynList = gynDAO.findGynList(univId);
         
         request.setAttribute("gynList", gynList); 

           return "/gyn/view.jsp";      // 찾아?�� ?��?���??��?�� �? redirect
           
      } catch (Exception e) {      // �삁�쇅 諛쒖�? �떆 �쉶�썝媛��엯 form�쑝濡� forwarding
         request.setAttribute("registerFailed", true);
         request.setAttribute("exception", e);
         return "/gyn/exception.jsp";
      }
    }
}