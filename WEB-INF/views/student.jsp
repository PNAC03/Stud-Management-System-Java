<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.lpu.domain.Student" %>
<html>

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./style.css">
    <script type="text/javascript" src="./script.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;400;500;600;700&display=swap" rel="stylesheet">
    <style>
    body {
  background-color: #121212;
  color: #ddd;
  font-family: 'Poppins', sans-serif;
}

.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

table {
  width: 100%;
  border-collapse: collapse;

}

.tabletop{
  padding-left: 0px;
  padding-bottom: 5px;
  text-align: left;
  border-bottom: 1px solid #333;
}


th,td {
  padding-left: 0px;
  padding-bottom: 10px;
  text-align: left;
}

input[type="text"],
input[type="email"],
input[type="number"],
input[type="password"] {
  padding: 10px;
  margin: 10px 0;
  width: 100%;
  background-color: #333;
  color: #ddd;
  border: none;
  border-radius: 5px;
  box-shadow: none;
}



/* Login Page */

input[type="submit"] {
  background-color: #ddd;
  color: #121212;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #fff;
  color: #121212;
}


/* Landing page */

.options{
  display:flex;
  margin-top:30px;
  
}

.StudentCard{
  margin-top:50px;
}

button {
  background-color: #e9eaec;
  color: #121212;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #fff;
  color: #121212;
}

.hlbutton{
  display:flex;
  background-color:#232225;
  width:38%;
  height:70px;
  padding:5px;
  border-radius: 5px;
}


#searchbox{
  margin-top:8px;
  margin-left:3px;
  width:50%;
}

#searchbut{
  margin-left:3px;
  
}

#addbut, #rembut, #updatebut, #showallbut{
  margin-left:10px;
}

tbody th{
  text-align: center;
  min-width:min-content;
  font-weight: bold;
  background-color: #232225;
  padding:15px 15px;
}

tbody td{
  text-align:center;
  min-width: fit-content;
  padding:auto;
}

.addrec, .remrec, .updaterec{
  margin-top:50px;
  border-radius: 5px;
  padding:10px;
  background-color: #232225;
}

.addrec input[type="text"], .remrec input[type="text"], .updaterec input[type="text"]{
  padding:10px;
  margin-bottom:10px;
  margin-left:10px;
  width:90%;
}

.addrecinter, .remrecinter, .updaterecinter{
  margin-bottom:30px;
}

.addrechead, .remrechead, .updaterechead{
  padding-left:15px;
  padding-top:10px;
}

.addrecbut, .remrecbut, .updaterecbut.{
  margin-left:35px;
  margin-top:10px
}
    </style>
    <script>
    function addCode() {
    	  clearspace();
    	  document.getElementById("rembut").disabled = false;
    	  document.getElementById("updatebut").disabled = false;
    	  document.getElementById("addremsection").innerHTML +=
    	  "<div class=addrec>\
    	  <label class=addrechead><h3>Add New Record</h3></label>\
    	  <form class=addrecinter name=\"addform\" action=\"/AddCodeServlet\" method=\"get\">\
    	  <input type=\"text\" placeholder=\"Name\" name=\"name\">\
    	  <input type=\"text\" placeholder=\"Student ID\" name=\"id\">\
    	  <input type=\"text\" placeholder=\"DOB\" name=\"dob\">\
    	  <input type=\"text\" placeholder=\"Password\" name=\"password\">\
    	  <input type=\"text\" placeholder=\"Program\" name=\"program\">\
    	  <input type=\"text\" placeholder=\"Section\" name=\"section\">\
    	  <input type=\"text\" placeholder=\"Email\" name=\"email\">\
    	  <input type=\"text\" placeholder=\"Phone\" name=\"phone\">\
    	  <input type=\"submit\" class=addrecbut value=\"Add Student\">\
    	  </form>\
    	  </div>";
    	  document.getElementById("addbut").disabled = true;
    	}

    	function removeCode() {
    	  clearspace();
    	  document.getElementById("addbut").disabled = false;
    	  document.getElementById("updatebut").disabled = false;
    	  document.getElementById("addremsection").innerHTML +=
    	  "<div class=remrec>\
    	  <label class=remrechead><h3>Remove Record</h3></label>\
    	  <form class=remrecinter name=\"remform\" action=\"/RemoveCodeServlet\" method=\"get\">\
    	  <input type=\"text\" placeholder=\"Student ID\" name=\"id\">\
    	  <input type=\"submit\" class=\"remrecbut\" value=\"Remove Student\">\
    	  </form>\
    	  </div>";
    	  document.getElementById("rembut").disabled = true;
    	}

    	function updateCode(){
    	  clearspace();
    	  document.getElementById("addbut").disabled = false;
    	  document.getElementById("rembut").disabled = false;
    	  document.getElementById("addremsection").innerHTML +=
    	  "<div class=updaterec>\
    	  <label class=updaterechead><h3>Update Existing Record</h3></label>\
    	  <form class=updaterecinter name=updateform method=get action=\"/UpdateServlet\">\
    	  <input type=\"text\" placeholder=\"Student ID*\" name=\"id\">\
    	  <input type=\"text\" placeholder=\"Name\" name=\"name\">\
    	  <input type=\"text\" placeholder=\"DOB\" name=\"dob\">\
    	  <input type=\"text\" placeholder=\"Password\" name=\"password\">\
    	  <input type=\"text\" placeholder=\"Program\" name=\"program\">\
    	  <input type=\"text\" placeholder=\"Section\" name=\"section\">\
    	  <input type=\"text\" placeholder=\"Email\" name=\"email\">\
    	  <input type=\"text\" placeholder=\"Phone\" name=\"phone\">\
    	  <label class=updaterechead>Fields marked with * are a must</label>\
    	  <br>\
    	  <input type=\"submit\" class=\"updaterecbut\" value=\"Update Record\">\
    	  </form>\
    	  </div>";
    	  document.getElementById("updatebut").disabled = true;
    	}

    	function clearspace(){
    	  document.getElementById("addremsection").innerHTML = "";
    	}
    	</script>
</head>

<body>
    <div class="container">
        <h1>Student Management System</h1>
        <table id="studentTable">
            <thead>
                <tr class="tabletop">
                    <th class="tabletop">
                        View and Manage Student Records
                    </th>
                </tr>
            </thead>
            <tbody id="studentRecords"></tbody>
        </table>

        <div class="options">
            <div class="hlbutton">
            <form action="/SearchIDServlet" method=get name=searchform>
            <input type="text" id="searchbox" placeholder="Search ID" name="searchstudid">
            <button id="searchbut">Search</button></div></form>
            <form action="/ShowAllServlet" method=get name=showallform>
            <button id="showallbut">Show All</button></form>
            <button id="addbut" onclick="addCode()">Add Records</button>
            <button id="rembut" onclick="removeCode()">Remove Records</button>
            <button id="updatebut" onclick="updateCode()">Update Records</button>
        </div>

        <div id="addremsection"></div>
		
		
        <table class="StudentCard">
            <tbody id="studentRecords">
                <tr>
                    <th>Name</th>
                    <th>Student ID</th>
                    <th>DOB</th>
                    <th>Password</th>
                    <th>Program</th>
                    <th>Section</th>
                    <th>Email</th>
                    <th>Phone</th>
                </tr>
                <% List<Student> ls = (List)request.getAttribute("studList");
		if(ls!=null){
		for(Student stu:ls){ %>
                <tr>
                    <td>
                        <%=stu.getname() %>
                    </td>
                    <td>
                        <%=stu.getid() %>
                    </td>
                    <td>
                        <%=stu.getdob() %>
                    </td>
                    <td>
                        <%=stu.getpassword() %>
                    </td>
                    <td>
                        <%=stu.getprogram() %>
                    </td>
                    <td>
                        <%=stu.getsection() %>
                    </td>
                    <td>
                        <%=stu.getemail() %>
                    </td>
                    <td>
                        <%=stu.getphone() %>
                    </td>
                </tr>
                 <% }} %>
            </tbody>
        </table>
       
    </div>
</body>

</html>