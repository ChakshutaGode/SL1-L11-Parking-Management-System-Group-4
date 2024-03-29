package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.*;

@WebServlet("/AdminUpdateDetails")
public class AdminUpdateDetails extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;  //for serializable warning

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		//get values from jsp form
		String name = request.getParameter("adminname");
		String mobile = request.getParameter("contactnumber");
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		try {
			Connection connection = DBconnection.getConnection();
			Statement statement = connection.createStatement();
			int updateinfo = statement.executeUpdate("update tbladmin set adminName='" + name + "',mobilenumber='" + mobile+ "',email='" + email + "' where username='" + session.getAttribute("uname") + "'");
			if (updateinfo > 0) {
				String message = "Profile updated sucessfully.";
				session.setAttribute("message", message);	//set session attribute for response page
				response.sendRedirect("admin-profile.jsp");   //open admin-profile.jsp
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
