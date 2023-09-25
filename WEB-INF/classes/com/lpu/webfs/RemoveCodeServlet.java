package com.lpu.webfs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;


/**
 * Servlet implementation class RemoveCodeServlet
 */
public class RemoveCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String stud_id = request.getParameter("id");
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
			String sql = "DELETE FROM student.student WHERE Student_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, stud_id);
			stmt.execute();
			request.getRequestDispatcher("/student").forward(request, response);
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
