<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
  * { box-sizing: border-box; margin: 0; padding: 0; }
  body { min-height: 100vh; display: flex; align-items: center; justify-content: center;
    background: linear-gradient(135deg, #0f172a 0%, #1e1b4b 50%, #0f172a 100%); font-family: sans-serif; }
  .card { background: rgba(255,255,255,0.05); border: 0.5px solid rgba(255,255,255,0.12);
    border-radius: 20px; padding: 2.5rem 2.25rem; width: 400px; backdrop-filter: blur(12px); }
  .logo { text-align: center; margin-bottom: 1.75rem; }
  .logo-icon { width: 52px; height: 52px; background: linear-gradient(135deg, #818cf8, #a78bfa);
    border-radius: 14px; margin: 0 auto 1rem; }
  .logo h1 { font-size: 22px; font-weight: 500; color: #f8fafc; }
  .logo p { font-size: 13px; color: rgba(255,255,255,0.45); margin-top: 4px; }
  .field { margin-bottom: 1rem; }
  .field label { display: block; font-size: 12px; font-weight: 500; color: rgba(255,255,255,0.5);
    text-transform: uppercase; letter-spacing: 0.08em; margin-bottom: 6px; }
  .field input { width: 100%; background: rgba(255,255,255,0.07); border: 0.5px solid rgba(255,255,255,0.15);
    border-radius: 10px; padding: 11px 14px; font-size: 14px; color: #f1f5f9; outline: none; }
  .field input:focus { border-color: #818cf8; background: rgba(129,140,248,0.1); }
  .btn-login { width: 100%; margin-top: 1.5rem; padding: 12px;
    background: linear-gradient(135deg, #818cf8, #a78bfa); border: none; border-radius: 10px;
    color: white; font-size: 15px; cursor: pointer; }
  .register { text-align: center; margin-top: 1.25rem; font-size: 13px; color: rgba(255,255,255,0.35); }
  .register a { color: #818cf8; text-decoration: none; font-weight: 500; }
</style>
</head>
<body>
  <div class="card">
    <div class="logo">
      <div class="logo-icon"></div>
      <h1>Welcome back</h1>
      <p>Sign in to your account</p>
    </div>
    <form action="Login" method="post">
      <div class="field">
        <label>Email address</label>
        <input type="text" name="Email" placeholder="you@example.com" required>
      </div>
      <div class="field">
        <label>Password</label>
        <input type="password" name="Password" placeholder="••••••••" required>
      </div>
      <button type="submit" class="btn-login">Log In</button>
      <div class="register">
        Don't have an account? <a href="register.jsp">Create one</a>
      </div>
    </form>
    <div class ="field">
         <button type="submit" class="btn-login"><a href="doctorLogin.jsp">Doctor Login</a></button>
        </div>
  </div>
</body>
</html>