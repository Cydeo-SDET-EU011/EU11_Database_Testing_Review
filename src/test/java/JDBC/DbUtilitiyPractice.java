package JDBC;

import utilities.*;

import java.util.*;

public class DbUtilitiyPractice {

    public static void main(String[] args) {

        String dbUrl = "jdbc:oracle:thin:@54.152.219.47:1521:XE";
        String dbUserName = "hr";
        String dbPassword = "hr";

        DBUtils.createConnection(dbUrl, dbUserName, dbPassword);

        String query = "select FIRST_NAME, LAST_NAME from EMPLOYEES order by FIRST_NAME";

        List<List<Object>> allNames = DBUtils.getQueryResultList(query);
        System.out.println(allNames);
//        for (List<Object> name : allNames) {
//            System.out.println(name);//
//        }
        String alberto = allNames.get(2).get(0).toString();
        System.out.println("alberto = " + alberto);

        List<Map<String,Object>> allNamesMap = DBUtils.getQueryResultMap(query);
        System.out.println(allNamesMap);
        String albertoAgain = allNamesMap.get(2).get("FIRST_NAME").toString();
        System.out.println("albertoAgain = " + albertoAgain);

        String adam = DBUtils.getCellValue(query).toString();
        System.out.println("adam = " + adam);

        String hunold = DBUtils.getCellValue(query,4,1).toString();
        System.out.println("hunold = " + hunold);

        String queryNames = "select min(salary),max(salary) from EMPLOYEES";

        System.out.println(DBUtils.getRowList(queryNames));


    }
}
