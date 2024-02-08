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
<h1> Delete Student </h1>
<form>
<input type="number" name="r" placeholder="Enter Rno"/>
<br><br>
<input type="submit" name="btn" value="Delete" class="btn"/>
<br><br>
</form>

<%
if(request.getParameter("btn")!=null)
{
int rno=Integer.parseInt(request.getParameter("r"));
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

String url="jdbc:mysql://localhost:3306/sms2024";
Connection con=DriverManager.getConnection(url,"root","Prathu@2001");

String sql="delete from student where rno=?";
PreparedStatement pst=con.prepareStatement(sql);
pst.setInt(1,rno);
long r=pst.executeUpdate();
%>
<script>
alert("Record Deleted");
</script>
<%
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