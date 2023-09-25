package com.lpu.webfs;

public class Student {
	String id;
	String name;
	String dob;
	String password;
	String program;
	String section;
	String email;
	String phone;
	
	public Student(String id, String name, String dob, String password, String program, String section, String email, String phone) {
		this.id = id;
		this.name = name;
		this.dob = dob;
		this.password = password;
		this.program = program;
		this.section = section;
		this.email = email;
		this.phone = phone;
	}
	
	public String getid() {
		return id;
	}

	public String getname() {
		return name;
	}

	public String getdob() {
		return dob;
	}

	public String getpassword() {
		return password;
	}

	public String getprogram() {
		return program;
	}

	public String getsection() {
		return section;
	}

	public String getemail() {
		return email;
	}

	public String getphone() {
		return phone;
	}
	
}
