package com.nguyentanhuy.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestJDBC {
	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/empdb";
		String user = "root";
		String pass = "";
		try {
			Connection connect = DriverManager.getConnection(url, user, pass);
			System.out.println("connected " + connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
