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
<h1> Edit Student </h1>
<form>
<input type="number" name="r" placeholder="Enter Rno"/>
<br><br>
<input type="text" name="n" placeholder="Enter Name"/>
<br><br>
<input type="text" name="s" placeholder="Enter Std"/>
<br><br>
<input type="text" name="d" placeholder="Enter Div"/>
<br><br>
<input type="text" name="g" placeholder="Enter Grade"/>
<br><br>
<input type="submit" name="btn" value="Update" class="btn"/>

</form>

<%
if(request.getParameter("btn")!=null)
{
int rno=Integer.parseInt(request.getParameter("r"));
String name=request.getParameter("n");
String std=request.getParameter("s");
String division=request.getParameter("d");
String grade=request.getParameter("g");
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

String url="jdbc:mysql://localhost:3306/sms2024";
Connection con=DriverManager.getConnection(url,"root","Prathu@2001");

String sql="update student set name=?,std=?,division=?,grade=? where rno=?";
PreparedStatement pst=con.prepareStatement(sql);
pst.setString(1,name);
pst.setString(2,std);
pst.setString(3,division);
pst.setString(4,grade);
pst.setInt(5,rno);
                
                long rc = pst.executeUpdate();
                if(rc == 0){
    %>
                    <script>
                        alert("No Record exist with Roll no. " + "<%= rno %>");
                    </script>
    <%
                }else {
    %>
                     <script>
                        alert("<%=rc%>" + " Record updated")
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