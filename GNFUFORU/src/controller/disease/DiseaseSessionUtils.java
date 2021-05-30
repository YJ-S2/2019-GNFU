package controller.disease;

import javax.servlet.http.HttpSession;

public class DiseaseSessionUtils {
	    public static final String DISKCD_SESSION_KEY = "disSaveKcd";
	    public static final String SAVEID_SESSION_KEY = "saveId";

	
	    
	    public static String getDisSaveKcd(HttpSession session) {
	        String disSaveKcd = (String)session.getAttribute(DISKCD_SESSION_KEY);
	        return disSaveKcd;
	    }
	    public static String getSaveId(HttpSession session) {
	        String saveId = (String)session.getAttribute(SAVEID_SESSION_KEY);
	        return saveId;
	    }


}
