<%@ page import="java.sql.*" %>


<html>
<head>
	<title>Student management system</title>
	<style>
		*{font-size:50px; }
		body{background-image: url('bg.jpg');
		background-size: cover; 		
		}
						
		.registered-link {color: blue;}
			
	</style>
</head>
<body>
<center>

	<h1>Login page</h1>
	<a href="signUp.jsp"class="registered-link">New user</a>
	<br><br>
	<form>
		<input type="text" name="un" placeholder="Enter username" required>
		<br><br>
		<input type="password" name="pw" placeholder="Enter password" required>
		<br><br>
		<input type="submit" value="Login" name="btn">
		<br><br>
	</form>
	<%
	if(request.getParameter("btn") != null)
	{
		String un=request.getParameter("un");
		String pw=request.getParameter("pw");
		
		
		try
		{
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		String url ="jdbc:mysql://localhost:3306/sms";
		Connection con = DriverManager.getConnection(url,"root","abc456");
		String sql ="select * from admin where username= ? and password= ?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,un);
		pst.setString(2,pw);
		ResultSet rs= pst.executeQuery();
		if(rs.next()){
			session.setAttribute("un",un);
			response.sendRedirect("Home.jsp");
		}else{
			out.println("invalid login");
		}
		con.close();
		
		}catch(SQLException e){
			out.println("Issue" +e);
		}
		
	}
	%>
</center>
</body>
</html>