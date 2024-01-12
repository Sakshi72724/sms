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
	<a href="Delete.jsp">Delete Student's data</a>
</div>
	<br>
	<form>
		<input type ="number" name="rno" placeholder="Enter roll number" required min=1>
		<br><br>
		
		<input type = "submit" value="Delete" name="btn" >
		<br>
		
	</form>
	<form>
		<input type="submit" value="Delete All" name="btnAll">
		<br>
	</form>
	<form>
		<button type="button" onclick="goBack()">Back</button>	
	</form>
	<%
	if(request.getParameter("btn")!=null)
	{
		int rno =Integer.parseInt(request.getParameter("rno"));
		
		try{
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		String url = "jdbc:mysql://localhost:3306/sms";
		Connection con = DriverManager.getConnection(url,"root","abc456");
		String sql = "delete from student where rno=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setInt(1,rno);
		pst.executeUpdate();
		out.println("Data deleted");
		con.close();
		}catch(SQLException e){
			out.println("Issue "+e);
		}
	}
	%>
	<%
	if (request.getParameter("btnAll") != null) {
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			String url = "jdbc:mysql://localhost:3306/sms";
			Connection con = DriverManager.getConnection(url, "root", "abc456");
			String sql = "delete from student";
			Statement stmt = con.createStatement();
			stmt.executeUpdate(sql);
			out.println("All data deleted");
			con.close();
		} catch (SQLException e) {
			out.println("Issue " + e);
		}
	}
	%>
</center>
</body>
</html>