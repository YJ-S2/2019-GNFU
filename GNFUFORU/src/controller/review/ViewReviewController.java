package controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Gyn;
import model.dao.GynDAO;

public class ViewReviewController implements Controller {
	private Gyn gyn;
	private static final Logger log = LoggerFactory.getLogger(ViewReviewController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	

		try {
			String cGynId = request.getParameter("getgynId");
			log.debug("Gyn Detail ViewId : {}", cGynId);

			GynDAO gynDAO = GynDAO.getInstance();
			 gyn = gynDAO.findGynDetailByGynId(cGynId);
		
			request.setAttribute("gyn", gyn);

			return "/review/insertForm.jsp";

		} catch (Exception e) { 
			return "/review/insertForm.jsp";
		}

	}

}
