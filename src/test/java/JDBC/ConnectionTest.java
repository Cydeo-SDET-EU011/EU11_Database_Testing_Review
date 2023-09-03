package JDBC;

import java.sql.*;

public class ConnectionTest {

    public static void main(String[] args) throws SQLException {

        String dbUrl = "jdbc:oracle:thin:@54.152.219.47:1521:XE";
        String dbUserName = "hr";
        String dbPassword = "hr";

        Connection conn = DriverManager.getConnection(dbUrl,dbUserName,dbPassword);
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
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

        rs.previous();

        //get all firstname from databas
//        while (rs.next()){
//            System.out.println("firstName: " + rs.getString("first_name"));
//        }

        rs.first();  // pointer will go to first row again
        System.out.println(rs.getString("first_name"));

        rs.last();// pointer will go to last row
        System.out.println(rs.getString("first_name"));

        rs.absolute(10);
        System.out.println(rs.getString("first_name"));

        // creating result set meta data
        ResultSetMetaData rsmd = rs.getMetaData();
        System.out.println(rsmd.getColumnName(1));
        System.out.println(rsmd.getColumnCount());


        // creating database meta data
        DatabaseMetaData dbmd = conn.getMetaData();
        System.out.println(dbmd.getDriverName());
        System.out.println(dbmd.getUserName());
        System.out.println(dbmd.getDatabaseProductName());


    }
}
