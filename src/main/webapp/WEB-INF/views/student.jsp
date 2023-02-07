<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./style.css">
    <script type="text/javascript" src="./script.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <style>
    body {
  background-color: #121212;
  color: #ddd;
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
  width:40%;
  height:70px;
  padding:5px;
  border-radius: 5px;
}


#searchbox{
  margin-top:8px;
  margin-left:10px;
  width:60%;
}

#searchbut{
  margin-left:5px;
  
}

#addbut, #rembut, #updatebut{
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

.addrecbut, .remrecbut, .updaterecbut{
  margin-left:15px;
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
    	  <form class=addrecinter name=\"addform\" action=\"http://localhost:8080/StudManagement/AddCodeServlet\" method=\"get\">\
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
    	  <form class=remrecinter name=\"remform\" action=\"http://localhost:8080/StudManagement/RemoveCodeServlet\" method=\"get\">\
    	  <input type=\"text\" placeholder=\"Student ID\" name=\"id\">\
    	  <input type=\"submit\" class=remrecbut value=\"Remove Student\">\
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
    	  <form class=updaterecinter method=get action=\"http://localhost:8080/StudManagement/UpdateServlet\">\
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
    	  <input type=\"submit\" class=updaterecbut value=\"Update Record\">\
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
            <form>
            <input type="text" id="searchbox" placeholder="Search Student ID">
            <button id="searchbut">Search</button></div></form>
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
                <tr>
                    <td>
                        Vasanthan
                    </td>
                    <td>
                        12010939
                    </td>
                    <td>
                        17/17/17
                    </td>
                    <td>
                        B.Tech CSE
                    </td>
                    <td>
                        K20EN
                    </td>
                    <td>
                        <label>new@gmail.com</label>
                    </td>
                    <td>
                        <label>9191919191</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Vasanthan
                    </td>
                    <td>
                        12010939
                    </td>
                    <td>
                        17/17/17
                    </td>
                    <td>
                        B.Tech CSE
                    </td>
                    <td>
                        K20EN
                    </td>
                    <td>
                        <label>new@gmail.com</label>
                    </td>
                    <td>
                        <label>9191919191</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Vasanthan
                    </td>
                    <td>
                        12010939
                    </td>
                    <td>
                        17/17/17
                    </td>
                    <td>
                        B.Tech CSE
                    </td>
                    <td>
                        K20EN
                    </td>
                    <td>
                        <label>new@gmail.com</label>
                    </td>
                    <td>
                        <label>9191919191</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Vasanthan
                    </td>
                    <td>
                        12010939
                    </td>
                    <td>
                        17/17/17
                    </td>
                    <td>
                        B.Tech CSE
                    </td>
                    <td>
                        K20EN
                    </td>
                    <td>
                        <label>new@gmail.com</label>
                    </td>
                    <td>
                        <label>9191919191</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Vasanthan
                    </td>
                    <td>
                        12010939
                    </td>
                    <td>
                        17/17/17
                    </td>
                    <td>
                        B.Tech CSE
                    </td>
                    <td>
                        K20EN
                    </td>
                    <td>
                        <label>new@gmail.com</label>
                    </td>
                    <td>
                        <label>9191919191</label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>

</html>