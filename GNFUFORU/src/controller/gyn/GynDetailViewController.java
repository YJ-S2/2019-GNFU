package controller.gyn;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Gyn;
import model.dao.GynDAO;

public class GynDetailViewController implements Controller {

   private Gyn gyn;
   private static final Logger log = LoggerFactory.getLogger(GynDetailViewController.class);

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
   

      try {
         String cGynId = request.getParameter("gynId");
         log.debug("Gyn Detail ViewId : {}", cGynId);

         GynDAO gynDAO = GynDAO.getInstance();
         gyn = gynDAO.findGynDetailByGynId(cGynId);

         request.setAttribute("gyn", gyn);

         return "/gyn/detail.jsp";

      } catch (Exception e) { 

         return "/gyn/exception.jsp";
      }

   }

}