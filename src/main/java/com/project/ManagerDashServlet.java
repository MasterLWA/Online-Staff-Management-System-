package com.project;

import java.io.IOException;
import java.util.ArrayList;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ManagerDashServlet")
public class ManagerDashServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ManagerDashServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hID = request.getParameter("mID");
		ArrayList<Project> proDetails = ProjectDBUtil.viewProjects(hID);
		request.setAttribute("proDetails", proDetails);
		RequestDispatcher dis = request.getRequestDispatcher("projects.jsp");
		dis.forward(request, response);

	}

}
