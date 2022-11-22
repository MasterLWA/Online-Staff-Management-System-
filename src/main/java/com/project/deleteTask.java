package com.project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteTask")
public class deleteTask extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("tID");
		String hID = request.getParameter("mID"); 
		
		boolean isTrue = taskDBUtil.deleteTask(id);
		
		if(isTrue == true) {
			request.setAttribute("mID", hID);
			RequestDispatcher dis = request.getRequestDispatcher("projects.jsp");
			dis.forward(request, response);
		}else {
			request.setAttribute("mID", hID);
			RequestDispatcher dis = request.getRequestDispatcher("projects.jsp");
			dis.forward(request, response);
		}
	}

}
