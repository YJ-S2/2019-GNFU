package model;

import java.sql.Date;

public class Disease {

	private String disKcd;
	private String disId;
	private String disName;
	private int disCount;
	private Date cDate;
	private String userId;
	private String disSaveKcd;
	private String disSaveKcdName;
	private String saveId;

	public Disease(String disId, String disName, int disCount, String disKcd) {
		this.disKcd = disKcd;
		this.disId = disId;
		this.disName = disName;
		this.disCount = disCount;
	}
	

	public Disease(String saveId) {
		super();
		this.saveId = saveId;
	}


	public String getSaveId() {
		return saveId;
	}

	public void setSaveId(String saveId) {
		this.saveId = saveId;
	}

	public Disease(String saveId, Date cDate, String userId, String disSaveKcd) {
		super();
		this.saveId = saveId;
		this.cDate = cDate;
		this.userId = userId;
		this.disSaveKcd = disSaveKcd;

	}

	public Disease(Date cDate, String userId, String disSaveKcd, String disSaveKcdName, String saveId) {
		super();
		this.cDate = cDate;
		this.userId = userId;
		this.disSaveKcd = disSaveKcd;
		this.disSaveKcdName = disSaveKcdName;
		this.saveId = saveId;
	}

	public void search(Disease searchDis) {
		this.disId = searchDis.disId;
		this.disName = searchDis.disName;
		this.disCount = searchDis.disCount;
		this.disKcd = searchDis.disKcd;
	}

	public String getDisSaveKcdName() {
		return disSaveKcdName;
	}

	public void setDisSaveKcdName(String disSaveKcdName) {
		this.disSaveKcdName = disSaveKcdName;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDisSaveKcd() {
		return disSaveKcd;
	}

	public void setDisSaveKcd(String disSaveKcd) {
		this.disSaveKcd = disSaveKcd;
	}

	public String getDisKcd() {
		return disKcd;
	}

	public void setDisKcd(String disKcd) {
		this.disKcd = disKcd;
	}

	public String getDisId() {
		return disId;
	}

	public void setDisId(String disId) {
		this.disId = disId;
	}

	public String getDisName() {
		return disName;
	}

	public void setDisName(String disName) {
		this.disName = disName;
	}

	public int getDisCount() {
		return disCount;
	}

	public void setDisCount(int disCount) {
		this.disCount = disCount;
	}

}
