<%@ page import="java.sql.* "%>

<html>
<head>
	<title> Student Management System</title>
	<style>
	*{font-size:40px; }
			body{background-image: url('bg.jpg');
			     background-size: cover; 		
			 }
			.nav{background-color: black; }
			.nav a{color:white; text-decoration: None; margin:8%; }
	</style>
<script>
	function goBack(){
		window.location.href = "Home.jsp";
	}
</script>
</head>
<body>
<center>
	<div class="nav">
	<a href="View.jsp">Student's Data</a>
</div>
	<h1>Student's Data</h1>
	
	<table border="5" style="width:80%">
		<tr>
		<th>Rno</th>
		<th>Name</th>
		<th>Marks</th>
		</tr>
	
	
	<%
		try{
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		String url = "jdbc:mysql://localhost:3306/sms";
		Connection con = DriverManager.getConnection(url,"root","abc456");
		String sql = "select * from student";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();

		while(rs.next()) 
		{
	%>
		<tr style="text-align:center;">
		<td> <%= rs.getInt(1) %> </td>
		<td> <%= rs.getString(2) %> </td>
		<td> <%= rs.getInt(3) %> </td>
		</tr>
		
		
	
	<%	}
		con.close();
		}catch(SQLException e){
			out.println("Issue "+e);
		}
	%>

	</table>
	<br>
	<button type="button" onclick="goBack()">Back</button>
	
</center>
</body>
</html>