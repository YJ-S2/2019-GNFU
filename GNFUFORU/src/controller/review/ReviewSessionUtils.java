package controller.review;

import javax.servlet.http.HttpSession;

public class ReviewSessionUtils {
    public static final String USER_SESSION_KEY = "userId";

    public static String getUserId(HttpSession session) {
        String userId = (String)session.getAttribute(USER_SESSION_KEY);
        return userId;
    }
    

}
