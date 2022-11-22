package com.project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateProject")
public class updateProject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pID = request.getParameter("pID");
		String pname = request.getParameter("pname");
//		String startDate = request.getParameter("startDate");
//		String dueDate = request.getParameter("dueDate");
		String pDescription = request.getParameter("pDescription");
		String hID = request.getParameter("mID");
				
		boolean isTrue;
		
		isTrue = ProjectDBUtil.updateProject(pID,pname,pDescription);
		
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
