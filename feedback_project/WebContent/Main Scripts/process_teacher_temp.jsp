<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
	// Initialize database connection parameters

	try {
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String database = (String) session.getAttribute("curdb");
		System.out.println("in process_teacher_temp : " + database);
		String userid = "Deva";
		String password = "dev123456";
		Class.forName(driver);
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		// get parameters from the previous page
		String sel_teach = request.getParameter("sel_teach");
		String sel_temp = request.getParameter("sel_temp");
		String[] arrOfStr = sel_teach.split("-", 2);
		String tid = arrOfStr[0];
		String sid = arrOfStr[1];

		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();

		// Insert into the question table
		String sql = "insert into teacher_subject_template values (" + tid + "," + sid + ",'" + sel_temp + "')";
		statement.executeUpdate(sql);
		connection.close();

		response.sendRedirect("Teacher_template.jsp?status=Mapping Added sucessfully");

	} catch (Exception e) {

		System.out.println(e.getMessage());
		response.sendRedirect("Teacher_template.jsp");
	}
%>
