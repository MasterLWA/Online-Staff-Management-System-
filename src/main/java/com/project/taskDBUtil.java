package com.project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class taskDBUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static Statement stmt2 = null;
	
	private static ResultSet rs = null;
	private static ResultSet rs2 = null;
	
	public static boolean addtask(String title, String status, String pid, String sid) {
			
			isSuccess = false;
			
			int convertedpID = Integer.parseInt(pid);
			int convertedsID = Integer.parseInt(sid);
			try {
				//DB connect part -------------------------------------------------------------------------------
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				//-----------------------------------------------------------------------------------------------
				
				String sql = "insert into task values(0,'"+title+"','"+status+"',"+convertedpID+","+convertedsID+") ";
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
	
	public static ArrayList<task> gettasks(String pid) {
		
		ArrayList<task> task = new ArrayList<>();

		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from task where project_id = '"+ pid +"'";
			rs = stmt.executeQuery(sql);
					
			while(rs.next()) {
				int tID = rs.getInt("task_id");
				String title = rs.getString("task_title");
				String status = rs.getString("task_status");
				int  tpid= rs.getInt("task_projectID");
				int  sid= rs.getInt("task_staff_id");
				String sql2 = "select * from staff where staffID = '"+ sid +"'";
				rs2 = stmt.executeQuery(sql2);
				
				if(rs2.next()) {
					String staffName = rs2.getString("firstName");	
					task t = new task(tID,tpid,sid,title,status,staffName);
					task.add(t);
				}
				
				return task;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return task;
		
	}
	
	public static boolean updatetask(String id, String title, String status, String pid, String sid) {
		
		isSuccess = false;
		int convertedID = Integer.parseInt(id);
		int convertedpID = Integer.parseInt(pid);
		int convertedsID = Integer.parseInt(sid);
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//-----------------------------------------------------------------------------------------------
			System.out.println(convertedID);
			String sql1 = "update task set task_title = '"+title+"',task_status = '"+status+"',task_projectID = "+convertedpID+",task_staff_id = "+convertedsID +" where task_id = "+convertedID+" ";
			int rs = stmt.executeUpdate(sql1);
			
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
	
	
	public static boolean deleteTask(String id) {
		
		int convertedID = Integer.parseInt(id);
		
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "Delete from task where task_id = "+convertedID+""; 
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
