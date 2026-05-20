<%@ page import="java.sql.*" %>
<%@ page import="com.nt.pack.DbConnect" %>

<%
String doctor =
(String)session.getAttribute("doctor");

if(doctor == null)
{
response.sendRedirect("doctorLogin.jsp");
return;
}

Connection con = DbConnect.getcon();

PreparedStatement pstmt =
con.prepareStatement(
		"SELECT * FROM APPOINTMENTS WHERE DOCTOR='Dr. Amit Sharma'"
);


ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard</title>

<style>

body{
font-family:Arial;
background:#f1f5f9;
padding:30px;
}

h2{
color:#2563eb;
}

table{
width:100%;
background:white;
border-collapse:collapse;
margin-top:20px;
}

th{
background:#2563eb;
color:white;
padding:12px;
}

td{
padding:12px;
border:1px solid #ddd;
text-align:center;
}

tr:hover{
background:#e2e8f0;
}

</style>

</head>

<body>

<h2>
<form action="Doctordashboard" method="post">
Welcome <%= doctor %>
</h2>

<h3>
Your Patient Appointments
</h3>

<table>

<tr>
<th>Patient Name</th>
<th>Email</th>
<th>Mobile</th>
<th>Date</th>
<th>Time</th>
</tr>

<%
while(rs.next())
{
%>

<tr>

<td>
<%= rs.getString("NAME") %>
</td>

<td>
<%= rs.getString("EMAIL") %>
</td>

<td>
<%= rs.getString("MOBILE") %>
</td>

<td>
<%= rs.getString("ADATE") %>
</td>

<td>
<%= rs.getString("ATIME") %>
</td>

</tr>

<%
}
%>

</table>

</form>

</body>
</html>