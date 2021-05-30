package model;
public class Gyn {
	private String gynAddr;
	private String gynTel;
	private String gynTime;
	private String gynNight;
	private String gynLunch;
	private String univId;
	private String gynId;
	private String gynName;
	
	
	public Gyn(String gynAddr, String gynTel, String gynTime, String gynNight, String gynLunch, String univId,
			String gynId, String gynName) {
		super();
		this.gynAddr = gynAddr;
		this.gynTel = gynTel;
		this.gynTime = gynTime;
		this.gynNight = gynNight;
		this.gynLunch = gynLunch;
		this.univId = univId;
		this.gynId = gynId;
		this.gynName = gynName;
	}
	
	
	public String getGynAddr() {
		return gynAddr;
	}
	public void setGynAddr(String gynAddr) {
		this.gynAddr = gynAddr;
	}
	public String getGynTel() {
		return gynTel;
	}
	public void setGynTel(String gynTel) {
		this.gynTel = gynTel;
	}
	public String getGynTime() {
		return gynTime;
	}
	public void setGynTime(String gynTime) {
		this.gynTime = gynTime;
	}
	public String getGynNight() {
		return gynNight;
	}
	public void setGynNight(String gynNight) {
		this.gynNight = gynNight;
	}
	public String getGynLunch() {
		return gynLunch;
	}
	public void setGynLunch(String gynLunch) {
		this.gynLunch = gynLunch;
	}
	public String getUnivId() {
		return univId;
	}
	public void setUnivId(String univId) {
		this.univId = univId;
	}
	public String getGynId() {
		return gynId;
	}
	public void setGynId(String gynId) {
		this.gynId = gynId;
	}
	public String getGynName() {
		return gynName;
	}
	public void setGynName(String gynName) {
		this.gynName = gynName;
	}
	
}
