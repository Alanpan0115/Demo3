<%@page  language="java" import="java.sql.*, java.util.*"%>

<%

    try {
        Class.forName("com.mysql.jdbc.Driver");

        try {
			String url="jdbc:mysql://localhost/?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			Connection con=DriverManager.getConnection(url,"root","1234");
			String sql="use egggg";
			con.createStatement().execute(sql);


%>