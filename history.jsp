<!DOCTYPE html>
<html>
<head>
<title>My Appointments</title>

<style>
body {
  font-family: Arial;
  text-align: center;
}

table {
  margin: 20px auto;
  border-collapse: collapse;
  width: 70%;
}

th, td {
  border: 1px solid black;
  padding: 10px;
}

th {
  background: #4facfe;
  color: white;
}

button {
  padding: 10px;
  background: red;
  color: white;
  border: none;
  cursor: pointer;
}
</style>

</head>

<body>

<h2>My Appointments</h2>

<table>
<tr>
<th>Name</th>
<th>Doctor</th>
<th>Date</th>
<th>Time</th>
</tr>

<tbody id="tbody"></tbody>

</table>

<br>

<button onclick="clearAll()">Clear All</button>

<script>

// LOAD DATA
let data = JSON.parse(localStorage.getItem("appointments"));

let tbody = document.getElementById("tbody");

if(data == null || data.length == 0){
  tbody.innerHTML = "<tr><td colspan='4'>No Data Found</td></tr>";
}else{

  for(let i=0; i<data.length; i++){

    let row = "<tr>" +
      "<td>"+data[i].name+"</td>" +
      "<td>"+data[i].doctor+"</td>" +
      "<td>"+data[i].date+"</td>" +
      "<td>"+data[i].time+"</td>" +
      "</tr>";

    tbody.innerHTML += row;
  }

}

// CLEAR ALL
function clearAll(){
  localStorage.removeItem("appointments");
  location.reload();
}

</script>

</body>
</html>