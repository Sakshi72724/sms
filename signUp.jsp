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


<h1>Signup page</h1>
	<a href="index.jsp" class="registered-link">Already registered</a>
	<br><br>
	<form method="post">
		<input type="text" name="un" placeholder="Enter username" required>
		<br><br>
		<input type="password" name="pw1" placeholder="Enter password" required>
		<br><br>
		<input type="password" name="pw2" placeholder="Confirm password" required>
		<br><br>
		<input type="submit" value="SignIn" name="btn">
		<br>
	</form>
	<%
	if(request.getParameter("btn") != null)
	{
		String un=request.getParameter("un");
		String pw1=request.getParameter("pw1");
		String pw2 = request.getParameter("pw2");
		
		if(! pw1.equals(pw2))
		{
			out.println("password did not match");
			return;
		}

		if (!pw1.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")) 
		{
            		out.println("Password must contain at least 8 characters, 			including at least one letter and one number.");
            		return;
        	}

		try
		{
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		String url ="jdbc:mysql://localhost:3306/sms";
		Connection con = DriverManager.getConnection(url,"root","abc456");
		String sql ="insert into admin values(?,?)";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,un);
		pst.setString(2,pw1);
		pst.executeUpdate();
		response.sendRedirect("index.jsp");
		con.close();
		
		}catch(SQLException e){
			out.println("Issue" +e);
		}
		
	}
	%>

</center>
</body>
</html>