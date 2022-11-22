package com.project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProjectsServlet")
public class ProjectsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProjectsServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hID = request.getParameter("mID");
		String pname = request.getParameter("pname");
		String startDate = request.getParameter("startDate");
		String dueDate = request.getParameter("dueDate");
		String pDescription = request.getParameter("pDescription");
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		boolean isTrue;
		isTrue = ProjectDBUtil.insertProject(pname, startDate, dueDate, pDescription, hID);
		if(isTrue == true) {
//			ArrayList<Project> proDetails = ProjectDBUtil.getProject(pname);
//			request.setAttribute("proDetails", proDetails);
//			  
//			RequestDispatcher dis = request.getRequestDispatcher("taskView.jsp");
//			dis.forward(request, response);
//			
////			System.out.println(proDetails);
			request.setAttribute("mID", hID);
			RequestDispatcher dis = request.getRequestDispatcher("projects.jsp");
			dis.forward(request, response);
		}else {
			
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Please Enter the correct Information and retry')");
			out.println("location = 'projects.jsp'");
			out.println("</script>");
		}
		
		
	}

}
