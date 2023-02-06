
function addCode() {
  clearspace();
  document.getElementById("rembut").disabled = false;
  document.getElementById("updatebut").disabled = false;
  document.getElementById("addremsection").innerHTML +=
  "<div class=addrec>\
  <label class=addrechead><h3>Add New Record</h3></label>\
  <div class=addrecinter>\
  <input type=text placeholder=\"Name\">\
  <input type=\"text\" placeholder=\"Student ID\">\
  <input type=\"text\" placeholder=\"DOB\">\
  <input type=\"text\" placeholder=\"Program\">\
  <input type=\"text\" placeholder=\"Section\">\
  <input type=\"text\" placeholder=\"Email\">\
  <input type=\"text\" placeholder=\"Phone\">\
  <button class=addrecbut>Add Student</button>\
  </div>\
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
  <div class=remrecinter>\
  <input type=\"text\" placeholder=\"Student ID\">\
  <button class=remrecbut>Remove Student</button>\
  </div>\
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
  <div class=updaterecinter>\
  <input type=text placeholder=\"Name\">\
  <input type=\"text\" placeholder=\"Student ID\">\
  <input type=\"text\" placeholder=\"DOB\">\
  <input type=\"text\" placeholder=\"Program\">\
  <input type=\"text\" placeholder=\"Section\">\
  <input type=\"text\" placeholder=\"Email\">\
  <input type=\"text\" placeholder=\"Phone\">\
  <button class=updaterecbut>Update Record</button>\
  </div>\
  </div>";
  document.getElementById("updatebut").disabled = true;
}

function clearspace(){
  document.getElementById("addremsection").innerHTML = "";
}