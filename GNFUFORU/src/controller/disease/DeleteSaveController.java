package controller.disease;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import controller.Controller;
import model.dao.DiseaseDAO;
import model.Disease;

public class DeleteSaveController implements Controller {

	private Disease delete;
	
	

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DiseaseDAO diseaseDAO = DiseaseDAO.getInstance();
		String deleteId = request.getParameter("delete");
		System.out.println("saveId:   " + deleteId);
		
		try {
			delete = new Disease(deleteId);
			diseaseDAO.remove(delete);
			
			
			String userId = request.getParameter("userId");
			List<Disease> saveList = diseaseDAO.findMySaveList(userId);
			request.setAttribute("saveList", saveList);			
			
			
			return "redirect:/user/his";
		
		} catch (Exception e) {
			return "/disease/exception.jsp";
		} 	
	}
}


