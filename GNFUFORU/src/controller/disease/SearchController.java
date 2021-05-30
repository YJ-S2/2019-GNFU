package controller.disease;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Disease;
import model.dao.DiseaseDAO;

public class SearchController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(SearchController.class);
    private String diskcd;
    private List<Disease> diseaseList;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

    	diskcd = request.getParameter("diskcd");
    	
   	
        log.debug("Search code : {}", diskcd);
        
        HttpSession session = request.getSession();
        session.setAttribute(DiseaseSessionUtils.DISKCD_SESSION_KEY, diskcd);
		try {
			DiseaseDAO diseaseDAO = DiseaseDAO.getInstance();
			diseaseList = diseaseDAO.findDiseaseList(diskcd);
			 
			request.setAttribute("disList", diseaseList); 

	        return "/disease/view.jsp";		
	        
		} catch (Exception e) {		
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			return "/disease/exception.jsp";
		}
    }
}
