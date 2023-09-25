package com.lpu.webfs;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class FormServlet
 */
public class AddCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCodeServlet() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String password = request.getParameter("password");
		String program = request.getParameter("program");
		String section = request.getParameter("section");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		String stud_id = request.getParameter("searchstudid");
		String instanceConnectionName = "hallowed-anthem-397605:us-east1:sql-db";
		String databaseName = "student";
		String IP_of_instance = "0.0.0.0:1234";
		String username = "root";
		String pass = "Asdf34567";

		String jdbcUrl = String.format(
		    "jdbc:mysql://%s/%s?cloudSqlInstance=%s"
		        + "&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false",
		IP_of_instance,
		    databaseName,
		    instanceConnectionName);

		try {
			DriverManager.registerDriver (new com.mysql.jdbc.Driver());
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			Connection con = DriverManager.getConnection(jdbcUrl, username, pass);
			String sql = "INSERT INTO `student`.`student`\r\n"
					+ "(`Student_id`,\r\n"
					+ "`Name`,\r\n"
					+ "`DOB`,\r\n"
					+ "`Password`,\r\n"
					+ "`Program`,\r\n"
					+ "`Section`,\r\n"
					+ "`Email`,\r\n"
					+ "`phone`)\r\n"
					+ "VALUES\r\n"
					+ "(?,\r\n"
					+ "?,\r\n"
					+ "?,\r\n"
					+ "?,\r\n"
					+ "?,\r\n"
					+ "?,\r\n"
					+ "?,\r\n"
					+ "?);";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, name);
			stmt.setString(3, dob);
			stmt.setString(4, password);
			stmt.setString(5, program);
			stmt.setString(6, section);
			stmt.setString(7, email);
			stmt.setString(8, phone);
			stmt.execute();
			request.getRequestDispatcher("/student").forward(request, response);
		}catch(SQLException e) {
			e.printStackTrace();
		}}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
