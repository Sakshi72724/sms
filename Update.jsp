<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Student Management System</title>
    <style>
        * {
            font-size: 40px;
        }

        body {
            background-image: url('bg.jpg');
            .nav {
                background-color: black;
                height: 75px;
            }

            .nav a {
                color: white;
                text-decoration: None;
                margin: 8%;
            }

            background-size: cover;
        }
    </style>
    <script>
        function goBack() {
            window.location.href = "Home.jsp";
        }
    </script>
</head>
<body>
<center>
    <div class="nav">
        <a href="Add.jsp">Update Student Data</a>
    </div>
    <br>
    <form>
        <input type="number" name="rno" placeholder="Enter rno" required min="1">
        <br><br>
        <input type="text" name="name" placeholder="Enter Name" required>
        <br><br>
        <input type="number" name="marks" placeholder="Enter marks" required min="0" max="100" style="width:600px;">
        <br><br>
        <input type="submit" value="Update" name="btnUpdate">
        <br><br>
        <button type="button" onclick="goBack()">Back</button>
    </form>

    <%
    

    if (request.getParameter("btnUpdate") != null) {
        int rno = Integer.parseInt(request.getParameter("rno"));
        String name = request.getParameter("name");
        int marks = Integer.parseInt(request.getParameter("marks"));
	
	if (name.length() < 2) 
		{
           		out.println("Name must be at least 2 characters long.");
            		return;
       		}

        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            String url = "jdbc:mysql://localhost:3306/sms";
            Connection con = DriverManager.getConnection(url, "root", "abc456");
            String sql = "update student set name=?, marks=? where rno=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, name);
            pst.setInt(2, marks);
            pst.setInt(3, rno);
            int rowsUpdated = pst.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("Record updated successfully");
            } else {
                out.println("No record found with the given rno: " + rno);
            }

            con.close();
        } catch (SQLException e) {
            out.println("Issue " + e);
        }
    }
    %>
    
</center>
</body>
</html>
