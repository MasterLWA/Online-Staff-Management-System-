package com.project;

public class task {
	private int tid;
	private int pid;
	private int sid;
	private String title;
	private String status;
	private String staffName;
	
	public task(int tid, int pid, int sid, String title, String status, String staffName) {
		this.tid = tid;
		this.pid = pid;
		this.sid = sid;
		this.title = title;
		this.status = status;
		this.staffName = staffName;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	
	
	
	
}
