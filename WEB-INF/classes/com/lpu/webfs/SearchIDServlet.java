package com.lpu.webfs;
import com.lpu.domain.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



/**
 * Servlet implementation class SearchIDServlet
 */
public class SearchIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public SearchIDServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String stu_id = request.getParameter("searchstudid");
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
			String sql = "select * from student.student where Student_id = ?;";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, stu_id);
			ResultSet rs = stmt.executeQuery();
			List lstStu = new ArrayList();
			
			while(rs.next()) {
				Student stu = new Student(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
				lstStu.add(stu);
				}
			request.setAttribute("studList", lstStu);
			request.getRequestDispatcher("/student").forward(request, response);	
		
			}
		catch(SQLException e){
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
