package com.lpu.dbtie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class jdbccode {
	
	Connection con;
	public void sqlconnect() {
		try {
			con=DriverManager.getConnection
					("jdbc:mysql://localhost:3306/hr", "root", "ADMIN");
		System.out.println(con);
		Statement stmt = con.createStatement();
		String sql = "select * from employees;";
		System.out.println(stmt.execute(sql));
		
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		jdbccode obj = new jdbccode();
		obj.sqlconnect();
	}
}
