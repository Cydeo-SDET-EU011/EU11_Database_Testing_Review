package JDBC;

import java.sql.*;

public class ConnectionTest {

    public static void main(String[] args) throws SQLException {

        String dbUrl = "jdbc:oracle:thin:@54.152.219.47:1521:XE";
        String dbUserName = "hr";
        String dbPassword = "hr";

        Connection conn = DriverManager.getConnection(dbUrl,dbUserName,dbPassword);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from EMPLOYEES");
        //ResultSet rs1 = stmt.executeQuery("select first_name from employees");

        rs.next();  // pointer moved to first line of database
        System.out.println(rs.getString("FIRST_NAME"));
        System.out.println(rs.getString("email"));

        rs.next();  // pointer moved to second line of database
        System.out.println(rs.getString("last_name"));

        rs.next(); //pointer moved to third line of database
        System.out.println(rs.getInt("employee_id"));
        System.out.println(rs.getString(7));

        //get all firstname from databas
        while (rs.next()){
            System.out.println("firstName: " + rs.getString("first_name"));
        }


    }
}
