package controller.disease;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Disease;
import model.dao.DiseaseDAO;

public class SaveViewController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DiseaseDAO diseaseDAO = DiseaseDAO.getInstance();
	   	String userId = request.getParameter("userId");

	 
	   	
	   	List<Disease> saveList = diseaseDAO.findMySaveList(userId);
		request.setAttribute("saveList", saveList);				
		
		return "/history/MySearch.jsp";        
	}	
}
