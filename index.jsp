<%@ page import="java.sql.*" %>
<html>
<head>
<title> S.M.S App </title>
<link rel="stylesheet" href="student.css"/>
</head>
<body>
<center>
<h1> Admin Login</h1>
<br>
<form>
<input type="text" name="un" placeholder="Enter username"/>
<br><br>
<input type="text" name="pw" placeholder="Enter password"/>
<br><br>
<input type="submit" name="btn" value="Login" class="btn""/>
</form>

<%
if(request.getParameter("btn")!=null)
{
String un=request.getParameter("un");
String pw=request.getParameter("pw");
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

String url="jdbc:mysql://localhost:3306/sms30sep23";
Connection con=DriverManager.getConnection(url,"root","Prathu@2001");

String sql="select * from users where username=? and password=?";
PreparedStatement pst=con.prepareStatement(sql);
pst.setString(1,un);
pst.setString(2,pw);
ResultSet rs=pst.executeQuery();
if(rs.next())
{
response.sendRedirect("view.jsp");
}
else
{
%>
<script>
alert("Invalid Login");
</script>
<%

}
con.close();
}
catch(SQLException e)
{
out.println("sql issue "+e);
}
}
%>

</center>
</body>
</html>