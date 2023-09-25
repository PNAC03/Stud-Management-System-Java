package com.lpu.webfs;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientConnectionException;
import java.sql.Statement;

/**
* A sample app that connects to a Cloud SQL instance and lists all available tables 
in a database.
*/

public class Cloud_sql {
public static void main(String[] args) throws
IOException, SQLException {

String instanceConnectionName = "studmanagement-389218:us-central1:sql-db";
String databaseName = "student";


String IP_of_instance = "0.0.0.0:1234";
String username = "root";
String password = "Asdf34567";

String jdbcUrl = String.format(
    "jdbc:mysql://%s/%s?cloudSqlInstance=%s"
        + "&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false",
IP_of_instance,
    databaseName,
    instanceConnectionName);

Connection connection = DriverManager.getConnection(jdbcUrl, username, password);

try (Statement statement = connection.createStatement()) {
  ResultSet resultSet = statement.executeQuery("SHOW TABLES;");
  while (resultSet.next()) {
    System.out.println(resultSet.getString(1));
  }
}catch(Exception e){
  e.printStackTrace();
}
}
}
