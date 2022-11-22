package com.project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class ProjectDBUtil {

	private static boolean isSuccess;
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static ResultSet rs2 = null;
	
	
	public static ArrayList<Project> viewProjects(String mid) {
		ArrayList<Project> pro = new ArrayList<>();

		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from project p,manager m where m.mID = p.handlerID and m.mID = '"+ mid +"'";
			rs = stmt.executeQuery(sql);

			
			while(rs.next()){

				int pID = rs.getInt(1);
				String pname = rs.getString(2);
				String startDate = rs.getString(3);
				String dueDate = rs.getString(4);
				String pDescription = rs.getString(5);
				int hID = rs.getInt(6);
				System.out.println(pDescription);
				String sql2 = "select firstName from staff where staffID = '"+ hID +"'";
				rs2 = stmt.executeQuery(sql2);
				
				if(rs2.next()) {
					String pManager = rs2.getString(1);	
					Project p = new Project(pID,pname,startDate,dueDate,pDescription,hID, pManager);
					System.out.println(p);
					pro.add(p);
				}		
//				Project p = new Project(pID,pname,startDate,dueDate,pDescription,hID);
//				System.out.println(p);
//				pro.add(p);
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
//		pro.forEach( (a)->System.out.println(a));
		return pro;
		
	}
	
	public static boolean insertProject(String pname, String startDate, String dueDate, String pDescription, String hID) {
		
		isSuccess = false;
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//------------------------------------------------------------------------------------------------------
			
			String sql = "insert into project values(0,'"+pname+"','"+startDate+"','"+dueDate+"','"+pDescription+"','"+hID+"') ";
			int rs = stmt.executeUpdate(sql);
			
			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;			
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static ArrayList<Project> getProject(String pid) {
		
		ArrayList<Project> pro = new ArrayList<>();

		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from project where project_id = '"+ pid +"'";
			rs = stmt.executeQuery(sql);
						
			while(rs.next()) {
				int pID = rs.getInt(1);
				String pname = rs.getString(2);
				String startDate = rs.getString(3);
				String dueDate = rs.getString(4);
				String pDescription = rs.getString(5);
				int hID = rs.getInt(6);
				
				String sql2 = "select firstName from staff where staffID = '"+ hID +"'";
				rs2 = stmt.executeQuery(sql2);
				
				if(rs2.next()) {
					String pManager = rs2.getString(1);	
					Project p = new Project(pID,pname,startDate,dueDate,pDescription,hID, pManager);
					pro.add(p);
				}
				
				return pro;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pro;
		
	}
	
	public static boolean updateProject(String pID , String pname, String pDescription) {
		
		
		boolean isSuccess = false;
		
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//------------------------------------------------------------------------------------------------------
			
			String sql = "update project set project_name = '"+pname+"',project_description = '"+pDescription+"' where project_id = '"+pID+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}else {
				isSuccess = false;			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	public static List<task> gettask(String projectid) {
		
		ArrayList<task> tk = new ArrayList<>();

		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from task where task_projectID = '"+ projectid +"'";
			rs = stmt.executeQuery(sql);
						
			while(rs.next()) {
				int tid = rs.getInt(1);
				String title  = rs.getString(2);
				String status = rs.getString(3);
				int pid = rs.getInt(4);
				int sid = rs.getInt(5);
				
				String sql2 = "select firstName from staff where staffID = '"+ sid +"'";
				rs2 = stmt.executeQuery(sql2);
				
				if(rs2.next()) {
					String staffName = rs2.getString(1);	
					task p = new task(tid, pid, sid, title, status, staffName);
					tk.add(p);
				}
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return tk;
	}

	
public static boolean deleteProject(String id) {
		
		int convertedID = Integer.parseInt(id);
		
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "Delete from project where  project_id = '"+convertedID+"'"; 
			int r = stmt.executeUpdate(sql);
			
			if(r > 0) {
				isSuccess = true;
			}else {
				isSuccess = false;
						
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	

}
