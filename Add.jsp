<%@ page import="java.sql.* "%>
<html>
<head>
	<title> Student Management System</title>
	 <style>
	*{font-size:40px; }
	body{background-image: url('bg.jpg');
	.nav{background-color: black; height:75px; }
	.nav a{color:white; text-decoration: None; margin:8%; }
						
	background-size: cover; 	
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
	<a href="Add.jsp">Add Student Data</a>
	
</div>
	<br>
	<form>
		<input type = "number" name="rno" placeholder="Enter rno" required min=1>
		<br><br>
		<input type = "text" name="name" placeholder="Enter Name" required min=1>
		<br><br>
		<input type = "number" name="marks" placeholder="Enter marks" 
		required min=0 max=100 style="width:600px;">
		<br><br>
		<input type = "submit" value="Save" name="btn" >
		<br><br>
		<button type="button" onclick="goBack()">Back</button>	
		
	</form>
	

	<%
	if(request.getParameter("btn")!=null)
	{
		int rno = Integer.parseInt(request.getParameter("rno"));
		String name =request.getParameter("name");
		int marks = Integer.parseInt(request.getParameter("marks"));

		if (name.length() < 2) 
		{
           		out.println("Name must be at least 2 characters long.");
            		return;
       		}

		try{
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		String url = "jdbc:mysql://localhost:3306/sms";
		Connection con = DriverManager.getConnection(url,"root","abc456");
		String checkSql = "SELECT rno FROM student WHERE rno=?";
        	PreparedStatement checkStmt = con.prepareStatement(checkSql);
        	checkStmt.setInt(1, rno);
        	ResultSet checkResult = checkStmt.executeQuery();
		  if (checkResult.next()) {
            	out.println("Student with Roll Number " + rno + " already exists.");
        	}else{
		String sql = "insert into student values(?,?,?)";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setInt(1,rno);
		pst.setString(2,name);
		pst.setInt(3,marks);
		pst.executeUpdate();
		out.println("record created");
		}
		con.close();
		}catch(SQLException e){
			out.println("Issue "+e);
		}
	}
	
	%>
	
</center>
</body>
</html>