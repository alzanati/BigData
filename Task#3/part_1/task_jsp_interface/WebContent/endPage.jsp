<%--
    Document   : index
    Created on : Apr 20, 2016, 11:44:32 AM
    Author     : root
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="org.apache.drill.jdbc.Driver"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Demo Query Test</title>
</head>

	<body>
		
		<p id="closure" name="closure">ss</p>
		<table border="1" width="100%" cellpadding="0" cellspacing="0">
		<tr>
            <th>ID</th>
            <th>lName</th>
            <th>fName</th>
            <th>City</th>
            <th>ZipCode</th>
        </tr>
        
		<%
		Class.forName("org.apache.drill.jdbc.Driver"); // to throw exception if Driver not found
		Connection connection =  new Driver().connect("jdbc:drill:drillbit=localhost", null);
		Statement st = connection.createStatement();
		String parameter = request.getParameter("query_parameter").toString();
		String name = request.getParameter("selection").toString();
		out.println(parameter);
		
		String sql1 = "use hbase";
		String sql2 = "select "
				+"convert_from(row_key, 'UTF8') as id, "
				+ "convert_from(medical_data.name." + name + ", 'UTF8') as "+ name +", "
				+ "convert_from(medical_data.address.City,'UTF8') as city, "
				+ "convert_from(medical_data.address.zipcode,'UTF8') as zipcode "
				+ "from medical_data "
				+ "where convert_from(medical_data.row_key, 'UTF8') = "
				+ "'"+parameter+"'";
				//+ request.getParameter("query_parameter");
		
		ResultSet rss = st.executeQuery(sql1);
		ResultSet rs = st.executeQuery(sql2);
		while(rs.next()){%>
			<tr> 
				<td> <%=rs.getString("id")%> </td>
				<td> <%=rs.getString(name)%> </td> 
				<td> <%=rs.getString("fname")%> </td> 
				<td> <%=rs.getString("City")%> </td> 
				<td> <%=rs.getString("zipcode")%> </td>  
			</tr>
		<%} %>
		</table>
	</body>
</html>