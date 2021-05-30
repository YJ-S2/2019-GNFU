package model;

import java.sql.Date;

public class UserHis {
		// -------------------------------
		private String userId;
		private String hisId;
		private String disCode;
		

		private String disName;
		private String gynName;
		private Date gynDate;

		// -------------------------------
		private String gynRevId;
		private String gynRev;
		
		
		
		
		
		

		public UserHis(String userId, String hisId, String gynRevId) {
			super();
			this.userId = userId;
			this.hisId = hisId;
			this.gynRevId = gynRevId;
		}


		public UserHis(String userId, String hisId, String disCode, String disName, String gynName, Date gynDate,
				String gynRevId, String gynRev) {
			super();
			this.userId = userId;
			this.hisId = hisId;
			this.disCode = disCode;
			this.disName = disName;
			this.gynName = gynName;
			this.gynDate = gynDate;
			this.gynRevId = gynRevId;
			this.gynRev = gynRev;
		}
		
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getHisId() {
			return hisId;
		}
		public void setHisId(String hisId) {
			this.hisId = hisId;
		}
		public String getDisCode() {
			return disCode;
		}
		public void setDisCode(String disCode) {
			this.disCode = disCode;
		}
		public String getDisName() {
			return disName;
		}
		public void setDisName(String disName) {
			this.disName = disName;
		}
		public String getGynName() {
			return gynName;
		}
		public void setGynName(String gynName) {
			this.gynName = gynName;
		}
		public Date getGynDate() {
			return gynDate;
		}
		public void setGynDate(Date gynDate) {
			this.gynDate = gynDate;
		}
		public String getGynRevId() {
			return gynRevId;
		}
		public void setGynRevId(String gynRevId) {
			this.gynRevId = gynRevId;
		}
		public String getGynRev() {
			return gynRev;
		}
		public void setGynRev(String gynRev) {
			this.gynRev = gynRev;
		}

		
	
}


