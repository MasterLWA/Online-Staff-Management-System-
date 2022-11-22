package com.project;

public class Project {
	private int pid;
	private String pname;
	private String startDate;
	private String dueDate;
	private String pDescription;
	private int hid;
	private String pManager;
	
	public Project(int pid, String pname,String startDate,String dueDate, String pDescription,int hid, String pManager){
		this.pid = pid;
		this.pname = pname;
		this.startDate = startDate;
		this.dueDate = dueDate;
		this.pDescription = pDescription;
		this.hid = hid;
		this.pManager = pManager;
	}
	
	public Project(int pid, String pname,String startDate,String dueDate, String pDescription,int hid){
		this.pid = pid;
		this.pname = pname;
		this.startDate = startDate;
		this.dueDate = dueDate;
		this.pDescription = pDescription;
		this.hid = hid;
		
		
	}
	
	public String getpManager() {
		return pManager;
	}


	public void setpManager(String pManager) {
		this.pManager = pManager;
	}


	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getpDescription() {
		return pDescription;
	}

	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}

	public int getHid() {
		return hid;
	}

	public void setHid(int hid) {
		this.hid = hid;
	}
	
	
}
