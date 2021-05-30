package controller.disease;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Disease;
import model.dao.DiseaseDAO;


public class SaveController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(SaveController.class);
	private Disease save;



	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String userId = UserSessionUtils.getLoginUserId(request.getSession());
        log.debug("Save User id : {}", userId);
        String disSaveKcd = DiseaseSessionUtils.getDisSaveKcd(request.getSession());
		try {
		save = new Disease(
				"",
				null,
				userId, 
				disSaveKcd);

		log.debug("Insert Save : {}", disSaveKcd);
		
		DiseaseDAO diseasedao = DiseaseDAO.getInstance();
		diseasedao.save(save);

		return "/disease/list.jsp";
		
		} catch (Exception e) {
			return "/disease/exception.jsp";
		}
	}
}

