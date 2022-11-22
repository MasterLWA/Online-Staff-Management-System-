package com.project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/insertTask")
public class insertTask extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task_projectID = request.getParameter("task_projectID");
		String task_title = request.getParameter("task_title");
		String status= request.getParameter("status");
		String sid = request.getParameter("select");
		String hID = request.getParameter("mID");
		
		boolean isTrue;
		isTrue = taskDBUtil.addtask(task_title, status, task_projectID ,sid);
		if(isTrue == true) {
			request.setAttribute("mID", hID);
			RequestDispatcher dis1 = request.getRequestDispatcher("projects.jsp");
			dis1.forward(request, response);
		}else {
			request.setAttribute("mID", hID);
			RequestDispatcher dis1 = request.getRequestDispatcher("projects.jsp");
			dis1.forward(request, response);
		}
	}

}
