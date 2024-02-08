<%@ page import="java.sql.*" %>
<html>
<head>
<title> SMS App </title>
<link rel="stylesheet" href="student.css"/>
</head>
<body>
<center>
<div class="nav">
<a href="view.jsp">View</a>
<a href="create.jsp">Add</a>
<a href="delete.jsp">Delete</a>
<a href="update.jsp">Edit</a>
<a href="logout.jsp">Logout</a>
</div>
<h1> Home Page </h1>
<table border="2" style="width:80%;">
<tr>
<th> Rno</th>
<th> Name</th>
<th> Std</th>
<th> Div</th>
<th> Grade</th>
</tr>
<%
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

String url="jdbc:mysql://localhost:3306/sms2024";
Connection con=DriverManager.getConnection(url,"root","Prathu@2001");

String sql="select * from student";
PreparedStatement pst=con.prepareStatement(sql);
ResultSet rs=pst.executeQuery();
while(rs.next())
{
%>
<tr style="text-align:center;">
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
</tr>
<%
}
con.close();
rs.close();
}
catch(SQLException e)
{
out.println("sql issue "+e);
}
%>
</table>
</center>
</body>
</html>
