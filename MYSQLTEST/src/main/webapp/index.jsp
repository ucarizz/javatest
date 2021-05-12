<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<body>

	<h2>Hello World!</h2>

	<h2>
		<%
		out.print("sss");
		%>
	</h2>
	<table>
		<%@ page import="java.util.*"%>
		<%@ page import="java.sql.*"%>
		<%
		Connection conn = null; 
		Statement state = null;
		ResultSet res = null;

		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/new_schema";

		String username = "root";
		String password = "12345678";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		String sqlCommand = "SELECT * FROM new_schema.new_table ";

		try {
			state = conn.createStatement();
			res = state.executeQuery(sqlCommand);

			while (res.next()) {
		%>
		<tr>
			<td><%=res.getInt("id")%></td>
			<td><%=res.getString("name")%></td>
			<td><%=res.getString("lastname")%></td>
		</tr>

		<%
		}

		} catch (Exception ex) {
		} finally {
		if (res != null)
		res.close();
		if (state != null)
		state.close();
		if (conn != null)
		conn.close();
		}
		%>
	</table>
</body>
</html>
