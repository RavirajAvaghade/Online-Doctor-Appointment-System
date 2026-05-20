<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Login</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:linear-gradient(135deg,#2563eb,#7c3aed);
overflow:hidden;
}

.login-box{

width:380px;
padding:40px;
background:rgba(255,255,255,0.12);

backdrop-filter:blur(12px);

border-radius:20px;

box-shadow:0 8px 32px rgba(0,0,0,0.2);

border:1px solid rgba(255,255,255,0.2);

color:white;
animation:fadeIn 1s ease;
}

.login-box h2{
text-align:center;
margin-bottom:30px;
font-size:32px;
font-weight:700;
}

.input-box{
margin-bottom:22px;
}

.input-box label{
display:block;
margin-bottom:8px;
font-size:15px;
font-weight:600;
}

.input-box input{

width:100%;
padding:14px;

border:none;
outline:none;

border-radius:12px;

background:rgba(255,255,255,0.2);

color:white;

font-size:15px;
}

.input-box input::placeholder{
color:#e2e8f0;
}

button{

width:100%;
padding:14px;

border:none;
border-radius:14px;

background:white;
color:#2563eb;

font-size:16px;
font-weight:700;

cursor:pointer;

transition:0.3s;
}

button:hover{

transform:translateY(-3px);

background:#dbeafe;

}

.logo{
text-align:center;
font-size:55px;
margin-bottom:15px;
}

@keyframes fadeIn{

from{
opacity:0;
transform:translateY(30px);
}

to{
opacity:1;
transform:translateY(0);
}

}

</style>

</head>

<body>

<div class="login-box">

<div class="logo">
🩺
</div>

<h2>Doctor Login</h2>

<form action="DoctorLogin" method="post">

<div class="input-box">

<label>Doctor Email</label>

<input type="text"
name="email"
placeholder="Enter Doctor Email">

</div>

<div class="input-box">

<label>Password</label>

<input type="password"
name="Password"
placeholder="Enter Password">

</div>

<button type="submit">
Login
</button>

</form>

</div>

</body>
</html>