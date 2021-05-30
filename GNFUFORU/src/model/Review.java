package model;

import java.util.*;

public class Review {
	private String revId;
	private String gynId;
	private String userId;
	private int grade;
	private Date date;
	private String content;
	private String gynName;

	public Review(String userId, String gynId, String revId, int grade, Date date, String content, String gynName) {
		super();
		this.revId = revId;
		this.gynId = gynId;
		this.userId = userId;
		this.grade = grade;
		this.date = date;
		this.content = content;
		this.gynName = gynName;
	}

	public Review(String userId, String gynId, String revId, int grade, Date date, String content) {
		super();
		this.revId = revId;
		this.gynId = gynId;
		this.userId = userId;
		this.grade = grade;
		this.date = date;
		this.content = content;

	}

	public Review(String revId, String gynId, String userId, int grade, String content) {
		super();
		this.revId = revId;
		this.gynId = gynId;
		this.userId = userId;
		this.grade = grade;
		this.content = content;
	}

	public Review(String revId, String userId) {
		super();
		this.revId = revId;
		this.userId = userId;
	}

	public String getGynName() {
		return gynName;
	}

	public void setGynName(String gynName) {
		this.gynName = gynName;
	}

	public String getRevId() {
		return revId;
	}

	public void setRevId(String revId) {
		this.revId = revId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getGynId() {
		return gynId;
	}

	public void setGynId(String gynId) {
		this.gynId = gynId;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}