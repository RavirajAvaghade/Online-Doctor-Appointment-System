<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CarePlus Hospital</title>
<link rel="stylesheet" href="Style.css">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:ital,wght@0,400;0,500;0,600;1,400&display=swap" rel="stylesheet">

<style>
/* ══════════════════════════════════════════
   RESET & TOKENS
══════════════════════════════════════════ */
*, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }

:root {
  --navy:   #050d1f;
  --deep:   #070f24;
  --card:   #0c1530;
  --blue:   #1a6fff;
  --cyan:   #00c2ff;
  --teal:   #00e5b0;
  --red:    #ff3b3b;
  --amber:  #ffb700;
  --border: rgba(255,255,255,0.07);
  --text:   #e8edf5;
  --muted:  #7a8499;
  --white:  #ffffff;
  --grad:   linear-gradient(135deg, #1a6fff, #00c2ff);
}

/* ══ LIGHT THEME ══ */
body.light {
  --navy:   #f0f4ff;
  --deep:   #e6ecf8;
  --card:   #ffffff;
  --blue:   #1a6fff;
  --cyan:   #0099cc;
  --teal:   #00a87a;
  --red:    #e03030;
  --amber:  #cc9200;
  --border: rgba(0,0,0,0.09);
  --text:   #1a2235;
  --muted:  #5a6680;
  --white:  #1a2235;
  --grad:   linear-gradient(135deg, #1a6fff, #00c2ff);
}

html { scroll-behavior: smooth; }

body {
  font-family: 'DM Sans', sans-serif;
  background: var(--navy);
  color: var(--text);
  overflow-x: hidden;
  transition: background 0.3s, color 0.3s;
}

/* ══════════════════════════════════════════
   NAVBAR
══════════════════════════════════════════ */
.navbar {
  position: fixed; top: 0; left: 0; right: 0; z-index: 100;
  display: flex; align-items: center; justify-content: space-between;
  padding: 0 5%;
  height: 68px;
  background: rgba(5,13,31,0.85);
  backdrop-filter: blur(18px);
  border-bottom: 1px solid var(--border);
  transition: box-shadow 0.3s, background 0.3s;
}
body.light .navbar {
  background: rgba(240,244,255,0.92);
}
.navbar.scrolled { box-shadow: 0 4px 30px rgba(0,0,0,0.5); }

.nav-brand {
  display: flex; align-items: center; gap: 10px;
  text-decoration: none;
}
.nav-logo-box {
  width: 38px; height: 38px; border-radius: 10px;
  background: var(--grad);
  display: flex; align-items: center; justify-content: center;
  font-size: 18px;
  box-shadow: 0 0 18px rgba(26,111,255,0.4);
}
.nav-brand-name {
  font-family: 'Syne', sans-serif;
  font-size: 20px; font-weight: 800;
  color: var(--white);
  letter-spacing: -0.5px;
}
.nav-brand-name span { color: var(--cyan); }

.nav-links {
  display: flex; align-items: center; gap: 4px;
  list-style: none;
}
.nav-links a {
  display: block;
  padding: 7px 14px;
  border-radius: 8px;
  color: var(--muted);
  text-decoration: none;
  font-size: 14px; font-weight: 500;
  transition: color 0.2s, background 0.2s;
}
.nav-links a:hover { color: var(--white); background: rgba(255,255,255,0.06); }
body.light .nav-links a:hover { background: rgba(0,0,0,0.05); }

.nav-links .nav-emergency a {
  color: var(--red); border: 1px solid rgba(255,59,59,0.3);
  border-radius: 8px;
}
.nav-links .nav-emergency a:hover { background: rgba(255,59,59,0.1); }
.nav-links .nav-logout a {
  color: var(--muted); border: 1px solid var(--border); border-radius: 8px;
}
.nav-links .nav-logout a:hover { background: rgba(255,255,255,0.05); color: var(--white); }

/* Theme toggle button */
.theme-toggle {
  width: 36px; height: 36px; border-radius: 9px;
  border: 1px solid var(--border);
  background: rgba(255,255,255,0.04);
  color: var(--muted);
  font-size: 16px;
  cursor: pointer;
  display: flex; align-items: center; justify-content: center;
  transition: background 0.2s, border-color 0.2s, color 0.2s;
  flex-shrink: 0;
}
.theme-toggle:hover { background: rgba(26,111,255,0.15); border-color: rgba(26,111,255,0.4); color: var(--white); }

/* ══════════════════════════════════════════
   HERO
══════════════════════════════════════════ */
.hero {
  min-height: 100vh;
  display: flex; align-items: center;
  padding: 100px 5% 60px;
  position: relative;
  overflow: hidden;
}

.hero::before {
  content: '';
  position: absolute; top: -20%; left: -10%;
  width: 700px; height: 700px; border-radius: 50%;
  background: radial-gradient(circle, rgba(26,111,255,0.12) 0%, transparent 70%);
  animation: drift 8s ease-in-out infinite alternate;
  pointer-events: none;
}
.hero::after {
  content: '';
  position: absolute; bottom: -10%; right: -5%;
  width: 500px; height: 500px; border-radius: 50%;
  background: radial-gradient(circle, rgba(0,194,255,0.09) 0%, transparent 70%);
  animation: drift 10s ease-in-out infinite alternate-reverse;
  pointer-events: none;
}
@keyframes drift { from{transform:translate(0,0)} to{transform:translate(30px,40px)} }

.hero-grid {
  position: absolute; inset: 0; z-index: 0;
  background-image:
    linear-gradient(rgba(255,255,255,0.02) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255,255,255,0.02) 1px, transparent 1px);
  background-size: 60px 60px;
  pointer-events: none;
}

.hero-inner {
  position: relative; z-index: 1;
  max-width: 1100px; margin: 0 auto; width: 100%;
  display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center;
}

.hero-badge {
  display: inline-flex; align-items: center; gap: 8px;
  background: rgba(26,111,255,0.1);
  border: 1px solid rgba(26,111,255,0.3);
  border-radius: 40px;
  padding: 7px 16px;
  font-size: 12px; font-weight: 600;
  color: var(--cyan); letter-spacing: 0.5px;
  text-transform: uppercase;
  margin-bottom: 22px;
  animation: fadeUp 0.5s ease both;
}
.hero-badge-dot { width:7px;height:7px;border-radius:50%;background:var(--cyan);animation:blink 1.5s infinite; }
@keyframes blink { 0%,100%{opacity:1}50%{opacity:0.2} }

.hero-title {
  font-family: 'Syne', sans-serif;
  font-size: clamp(36px, 4.5vw, 58px);
  font-weight: 800; line-height: 1.1;
  letter-spacing: -2px; color: var(--white);
  margin-bottom: 20px;
  animation: fadeUp 0.5s 0.1s ease both;
}
.hero-title .hl {
  background: var(--grad);
  -webkit-background-clip: text; -webkit-text-fill-color: transparent;
}

.hero-sub {
  font-size: 16px; line-height: 1.75;
  color: var(--muted); max-width: 440px;
  margin-bottom: 36px;
  animation: fadeUp 0.5s 0.2s ease both;
}

.hero-actions {
  display: flex; gap: 14px; align-items: center;
  animation: fadeUp 0.5s 0.3s ease both;
}
.btn-primary {
  padding: 14px 30px;
  background: var(--grad);
  border: none; border-radius: 12px;
  color: #fff; font-family: 'Syne', sans-serif;
  font-size: 15px; font-weight: 700;
  cursor: pointer; text-decoration: none;
  box-shadow: 0 8px 28px rgba(26,111,255,0.4);
  transition: transform 0.2s, box-shadow 0.2s;
  display: inline-block;
}
.btn-primary:hover { transform: translateY(-2px); box-shadow: 0 14px 36px rgba(26,111,255,0.5); }

.btn-ghost {
  padding: 13px 26px;
  background: transparent;
  border: 1px solid var(--border);
  border-radius: 12px;
  color: var(--muted); font-size: 15px;
  cursor: pointer; text-decoration: none;
  transition: color 0.2s, border-color 0.2s, background 0.2s;
  display: inline-block;
}
.btn-ghost:hover { color: var(--white); border-color: rgba(255,255,255,0.2); background: rgba(255,255,255,0.04); }

/* Hero visual card */
.hero-visual {
  animation: fadeUp 0.5s 0.2s ease both;
  position: relative;
}
.hero-card-main {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: 24px;
  padding: 28px;
  box-shadow: 0 30px 60px rgba(0,0,0,0.4);
}
.hero-card-main .card-header {
  display: flex; align-items: center; justify-content: space-between;
  margin-bottom: 22px;
}
.card-header-title {
  font-family: 'Syne', sans-serif; font-size: 14px; font-weight: 700; color: var(--white);
}
.card-header-badge {
  background: rgba(0,229,176,0.12); color: var(--teal);
  border: 1px solid rgba(0,229,176,0.3);
  padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: 600;
}
.stat-row { display: grid; grid-template-columns: repeat(3,1fr); gap: 12px; margin-bottom: 18px; }
.stat-box {
  background: rgba(255,255,255,0.03);
  border: 1px solid var(--border);
  border-radius: 12px; padding: 14px 12px; text-align: center;
}
.stat-num { font-family:'Syne',sans-serif; font-size: 22px; font-weight:800; color: var(--white); }
.stat-lbl { font-size: 11px; color: var(--muted); margin-top: 3px; }
.doctor-row { display:flex; gap:10px; flex-direction:column; }
.doc-item {
  display: flex; align-items: center; gap: 12px;
  background: rgba(255,255,255,0.025);
  border: 1px solid var(--border);
  border-radius: 12px; padding: 12px 14px;
}
.doc-av {
  width:38px;height:38px;border-radius:50%;
  background: var(--grad); display:flex;align-items:center;justify-content:center;
  font-size:16px; flex-shrink:0;
}
.doc-name { font-size:13px;font-weight:600;color:var(--white); }
.doc-spec { font-size:11px;color:var(--muted); }
.doc-badge {
  margin-left:auto; background:rgba(0,229,176,0.1);
  color:var(--teal); border:1px solid rgba(0,229,176,0.25);
  padding:3px 9px;border-radius:20px;font-size:11px;font-weight:600;
}

.hero-float {
  position: absolute; bottom: -20px; left: -28px;
  background: var(--card); border:1px solid var(--border);
  border-radius: 14px; padding: 12px 16px;
  display: flex; align-items: center; gap: 10px;
  box-shadow: 0 12px 32px rgba(0,0,0,0.4);
  animation: float 3s ease-in-out infinite;
}
@keyframes float { 0%,100%{transform:translateY(0)} 50%{transform:translateY(-8px)} }
.float-icon { font-size:22px; }
.float-val { font-family:'Syne',sans-serif;font-size:16px;font-weight:800;color:var(--white); }
.float-lbl { font-size:11px;color:var(--muted); }

/* ══════════════════════════════════════════
   STATS STRIP
══════════════════════════════════════════ */
.stats-strip {
  background: var(--card);
  border-top: 1px solid var(--border);
  border-bottom: 1px solid var(--border);
  padding: 28px 5%;
}
.stats-inner {
  max-width: 1100px; margin: 0 auto;
  display: grid; grid-template-columns: repeat(4,1fr);
  gap: 0;
}
.stat-item {
  text-align: center; padding: 10px 20px;
  border-right: 1px solid var(--border);
}
.stat-item:last-child { border-right: none; }
.stat-item .big { font-family:'Syne',sans-serif;font-size:32px;font-weight:800;color:var(--white); }
.stat-item .big span { color:var(--cyan); }
.stat-item .lbl { font-size:13px;color:var(--muted);margin-top:4px; }

/* ══════════════════════════════════════════
   FEATURES
══════════════════════════════════════════ */
.features-section {
  padding: 90px 5%;
  max-width: 1100px; margin: 0 auto;
}
.section-eyebrow {
  text-align: center;
  font-size: 12px; font-weight: 700;
  text-transform: uppercase; letter-spacing: 2px;
  color: var(--cyan); margin-bottom: 14px;
}
.section-title {
  text-align: center;
  font-family: 'Syne', sans-serif;
  font-size: clamp(26px,3.5vw,40px); font-weight: 800;
  letter-spacing: -1px; color: var(--white);
  margin-bottom: 50px;
}
.section-title span { color: var(--cyan); }

.features-grid {
  display: grid;
  grid-template-columns: repeat(4,1fr);
  gap: 18px;
}

.feature-card {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: 20px;
  padding: 28px 24px;
  transition: transform 0.25s, box-shadow 0.25s, border-color 0.25s;
  cursor: default;
}
.feature-card:hover {
  transform: translateY(-6px);
  box-shadow: 0 20px 50px rgba(0,0,0,0.4);
  border-color: rgba(26,111,255,0.3);
}
.feature-card.emergency:hover { border-color: rgba(255,59,59,0.35); }

.f-icon {
  width: 52px; height: 52px; border-radius: 14px;
  background: rgba(26,111,255,0.12);
  display: flex; align-items: center; justify-content: center;
  font-size: 24px; margin-bottom: 18px;
}
.feature-card.emergency .f-icon { background: rgba(255,59,59,0.1); }

.feature-card h3 {
  font-family: 'Syne', sans-serif;
  font-size: 16px; font-weight: 700;
  color: var(--white); margin-bottom: 8px;
}
.feature-card p { font-size: 13px; line-height: 1.7; color: var(--muted); }

.f-arrow {
  display: inline-flex; align-items: center; gap: 5px;
  margin-top: 16px; font-size: 12px; font-weight: 600;
  color: var(--blue); text-decoration: none;
  transition: gap 0.2s;
}
.f-arrow:hover { gap: 8px; }
.feature-card.emergency .f-arrow { color: var(--red); }

/* ══════════════════════════════════════════
   DEPARTMENTS
══════════════════════════════════════════ */
.dept-section {
  padding: 0 5% 90px;
  max-width: 1100px; margin: 0 auto;
}
.dept-grid {
  display: grid; grid-template-columns: repeat(6,1fr); gap: 14px;
}
.dept-item {
  background: var(--card); border:1px solid var(--border);
  border-radius: 16px; padding: 20px 12px;
  text-align: center;
  transition: transform 0.2s, border-color 0.2s;
  cursor: default;
}
.dept-item:hover { transform: translateY(-4px); border-color: rgba(26,111,255,0.3); }
.dept-emoji { font-size: 28px; margin-bottom: 10px; }
.dept-name { font-size: 12px; font-weight: 600; color: var(--muted); }

/* ══════════════════════════════════════════
   CTA BANNER
══════════════════════════════════════════ */
.cta-section {
  margin: 0 5% 90px;
  background: linear-gradient(135deg, #0b1e4a, #0c2860);
  border: 1px solid rgba(26,111,255,0.25);
  border-radius: 24px;
  padding: 56px 48px;
  text-align: center;
  position: relative; overflow: hidden;
}
body.light .cta-section {
  background: linear-gradient(135deg, #dce8ff, #c8daff);
  border-color: rgba(26,111,255,0.3);
}
.cta-section::before {
  content: '';
  position: absolute; top:-50%;left:-10%;
  width:500px;height:500px;border-radius:50%;
  background:radial-gradient(circle,rgba(26,111,255,0.15) 0%,transparent 70%);
  pointer-events: none;
}
.cta-section h2 {
  font-family:'Syne',sans-serif;font-size:clamp(24px,3vw,36px);
  font-weight:800;letter-spacing:-1px;color:var(--white);margin-bottom:12px;
}
.cta-section p { font-size:15px;color:rgba(255,255,255,0.55);margin-bottom:30px; }
body.light .cta-section p { color: var(--muted); }

/* ══════════════════════════════════════════
   FOOTER
══════════════════════════════════════════ */
footer {
  background: var(--deep);
  border-top: 1px solid var(--border);
  padding: 56px 5% 28px;
}
.footer-inner {
  max-width: 1100px; margin: 0 auto;
  display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 40px;
  padding-bottom: 40px;
  border-bottom: 1px solid var(--border);
}
.footer-brand p { font-size:13px;color:var(--muted);margin:12px 0 20px;line-height:1.7;max-width:280px; }

.social-row { display:flex;gap:10px; }
.social-btn {
  width:36px;height:36px;border-radius:9px;
  border:1px solid var(--border);
  background:rgba(255,255,255,0.03);
  color:var(--muted);font-size:15px;
  display:flex;align-items:center;justify-content:center;
  text-decoration:none;transition:background 0.2s,border-color 0.2s,color 0.2s;
  cursor:pointer;
}
.social-btn:hover { background:rgba(26,111,255,0.15);border-color:rgba(26,111,255,0.4);color:var(--white); }

.footer-col h4 {
  font-family:'Syne',sans-serif;font-size:13px;font-weight:700;
  text-transform:uppercase;letter-spacing:1px;
  color:var(--white);margin-bottom:16px;
}
.footer-col ul { list-style:none; }
.footer-col ul li { margin-bottom:10px; }
.footer-col ul li a {
  font-size:13px;color:var(--muted);text-decoration:none;
  transition:color 0.2s;
}
.footer-col ul li a:hover { color:var(--white); }

.footer-contact-item {
  display:flex;align-items:flex-start;gap:8px;
  font-size:13px;color:var(--muted);margin-bottom:10px;
}
.footer-contact-item span:first-child { font-size:15px; flex-shrink:0; }

.footer-bottom {
  max-width:1100px;margin:24px auto 0;
  display:flex;align-items:center;justify-content:space-between;
  font-size:12px;color:rgba(122,132,153,0.5);
}
.footer-bottom a { color:rgba(122,132,153,0.5);text-decoration:none; }
.footer-bottom a:hover { color:var(--muted); }

/* ══════════════════════════════════════════
   ANIMATIONS
══════════════════════════════════════════ */
@keyframes fadeUp {
  from{opacity:0;transform:translateY(22px)} to{opacity:1;transform:translateY(0)}
}

/* ══════════════════════════════════════════
   RESPONSIVE
══════════════════════════════════════════ */
@media(max-width:900px){
  .hero-inner { grid-template-columns:1fr; }
  .hero-visual { display:none; }
  .features-grid { grid-template-columns:repeat(2,1fr); }
  .dept-grid { grid-template-columns:repeat(3,1fr); }
  .footer-inner { grid-template-columns:1fr 1fr; }
  .stats-inner { grid-template-columns:repeat(2,1fr); }
}
@media(max-width:600px){
  .features-grid { grid-template-columns:1fr; }
  .dept-grid { grid-template-columns:repeat(2,1fr); }
  .footer-inner { grid-template-columns:1fr; }
  .stats-inner { grid-template-columns:repeat(2,1fr); }
  .nav-links { display:none; }
  .cta-section { padding:36px 24px; }
}
</style>
</head>

<body>

<!-- ══════════════ NAVBAR ══════════════ -->
<nav class="navbar" id="navbar">
  <a href="Home.jsp" class="nav-brand">
    <div class="nav-logo-box">🏥</div>
    <span class="nav-brand-name">Care<span>Plus</span></span>
  </a>

  <ul class="nav-links">
    <li><a href="Home.jsp">Home</a></li>
    <li><a href="doctors.jsp">Doctors</a></li>
    <li><a href="book.jsp">Book</a></li>
    <li><a href="history.jsp">History</a></li>
    <li><a href="prescription.jsp">Prescription</a></li>
    <li class="nav-emergency"><a href="emergency.jsp">🚨 Emergency</a></li>
    <li class="nav-logout"><a href="login.jsp">Logout</a></li>
    <li>
      <!-- Theme Toggle Button -->
      <button class="theme-toggle" id="themeToggleBtn" onclick="toggleTheme()" title="Toggle Theme">🌙</button>
    </li>
  </ul>
</nav>

<!-- ══════════════ HERO ══════════════ -->
<form action="Home" method="post">
<section class="hero">
  <div class="hero-grid"></div>
  <div class="hero-inner">

    <!-- Left text -->
    <div class="hero-text">
      <div class="hero-badge"><span class="hero-badge-dot"></span> Trusted by 50,000+ Patients</div>
      <h1 class="hero-title">Your Health,<br>Our <span class="hl">Priority</span></h1>
      <p class="hero-sub">
        Book appointments, consult expert doctors &amp; manage your complete medical history — all from home.
      </p>
      <div class="hero-actions">
        <a href="book.jsp" class="btn-primary">📅 Book Appointment</a>
        <a href="doctors.jsp" class="btn-ghost">Meet Our Doctors →</a>
      </div>
    </div>

    <!-- Right visual card -->
    <div class="hero-visual">
      <div class="hero-card-main">
        <div class="card-header">
          <span class="card-header-title">Today's Schedule</span>
          <span class="card-header-badge">● Live</span>
        </div>
        <div class="stat-row">
          <div class="stat-box"><div class="stat-num">48</div><div class="stat-lbl">Appointments</div></div>
          <div class="stat-box"><div class="stat-num">12</div><div class="stat-lbl">Doctors On</div></div>
          <div class="stat-box"><div class="stat-num">3</div><div class="stat-lbl">Emergency</div></div>
        </div>
        <div class="doctor-row">
          <div class="doc-item">
            <div class="doc-av">👨‍⚕️</div>
            <div><div class="doc-name">Dr. Sharma</div><div class="doc-spec">Cardiologist</div></div>
            <span class="doc-badge">Available</span>
          </div>
          <div class="doc-item">
            <div class="doc-av">👩‍⚕️</div>
            <div><div class="doc-name">Dr. Priya</div><div class="doc-spec">Neurologist</div></div>
            <span class="doc-badge">Available</span>
          </div>
        </div>
      </div>
      <div class="hero-float">
        <span class="float-icon">❤️</span>
        <div><div class="float-val">98.6°F</div><div class="float-lbl">Normal Vitals</div></div>
      </div>
    </div>

  </div>
</section>

<!-- ══════════════ STATS STRIP ══════════════ -->
<div class="stats-strip">
  <div class="stats-inner">
    <div class="stat-item"><div class="big">50<span>K+</span></div><div class="lbl">Happy Patients</div></div>
    <div class="stat-item"><div class="big">120<span>+</span></div><div class="lbl">Expert Doctors</div></div>
    <div class="stat-item"><div class="big">25<span>+</span></div><div class="lbl">Departments</div></div>
    <div class="stat-item"><div class="big">24<span>/7</span></div><div class="lbl">Emergency Care</div></div>
  </div>
</div>

<!-- ══════════════ FEATURES ══════════════ -->
<div class="features-section">
  <div class="section-eyebrow">Why Choose Us</div>
  <h2 class="section-title">Everything You Need,<br><span>In One Place</span></h2>

  <div class="features-grid">
    <div class="feature-card">
      <div class="f-icon">👨‍⚕️</div>
      <h3>Expert Doctors</h3>
      <p>Qualified specialists across all departments with years of proven experience.</p>
      <a href="doctors.jsp" class="f-arrow">View Doctors →</a>
    </div>
    <div class="feature-card">
      <div class="f-icon">📅</div>
      <h3>Easy Booking</h3>
      <p>Book appointments in just one click — anytime, from anywhere.</p>
      <a href="book.jsp" class="f-arrow">Book Now →</a>
    </div>
    <div class="feature-card">
      <div class="f-icon">📄</div>
      <h3>Digital History</h3>
      <p>Access your complete medical history and prescriptions anytime securely.</p>
      <a href="history.jsp" class="f-arrow">View History →</a>
    </div>
    <div class="feature-card emergency">
      <div class="f-icon">🚑</div>
      <h3>Emergency Care</h3>
      <p>24/7 ambulance &amp; emergency support — we're always here for you.</p>
      <a href="emergency.jsp" class="f-arrow">Get Help →</a>
    </div>
  </div>
</div>

<!-- ══════════════ DEPARTMENTS ══════════════ -->
<div class="dept-section">
  <div class="section-eyebrow">Our Departments</div>
  <h2 class="section-title" style="margin-bottom:30px;">Specialized <span>Care Units</span></h2>
  <div class="dept-grid">
    <div class="dept-item"><div class="dept-emoji">🫀</div><div class="dept-name">Cardiology</div></div>
    <div class="dept-item"><div class="dept-emoji">🧠</div><div class="dept-name">Neurology</div></div>
    <div class="dept-item"><div class="dept-emoji">🦷</div><div class="dept-name">Dentistry</div></div>
    <div class="dept-item"><div class="dept-emoji">👁️</div><div class="dept-name">Ophthalmology</div></div>
    <div class="dept-item"><div class="dept-emoji">🦴</div><div class="dept-name">Orthopaedics</div></div>
    <div class="dept-item"><div class="dept-emoji">👶</div><div class="dept-name">Paediatrics</div></div>
  </div>
</div>

<!-- ══════════════ CTA ══════════════ -->
<div class="cta-section">
  <h2>Book Your Appointment Today</h2>
  <p>Join thousands of patients who trust CarePlus for world-class healthcare.</p>
  <a href="book.jsp" class="btn-primary">Get Started →</a>
</div>

</form>

<!-- ══════════════ FOOTER ══════════════ -->
<footer>
  <div class="footer-inner">

    <div class="footer-brand">
      <a href="Home.jsp" class="nav-brand" style="margin-bottom:2px;display:inline-flex;">
        <div class="nav-logo-box">🏥</div>
        <span class="nav-brand-name" style="font-size:18px;">Care<span>Plus</span></span>
      </a>
      <p>Providing world-class healthcare with compassion and cutting-edge technology since 2010.</p>
      <div class="social-row">
        <a class="social-btn" href="https://www.facebook.com/profile.php?id=100088360959765" title="Facebook">f</a>
        <a class="social-btn" href="" title="Twitter/X">𝕏</a>
        <a class="social-btn" href="https://www.instagram.com/raviraj_____17/" title="Instagram">📷</a>
        <a class="social-btn" href="https://www.linkedin.com/in/raviraj-avaghade-413b0b301/?skipRedirect=true" title="LinkedIn">in</a>
        <a class="social-btn" href="" title="YouTube">▶</a>
      </div>
    </div>

    <div class="footer-col">
      <h4>Quick Links</h4>
      <ul>
        <li><a href="Home.jsp">Home</a></li>
        <li><a href="doctors.jsp">Our Doctors</a></li>
        <li><a href="book.jsp">Book Appointment</a></li>
        <li><a href="history.jsp">Medical History</a></li>
        <li><a href="prescription.jsp">Prescription</a></li>
        <li><a href="emergency.jsp">Emergency</a></li>
      </ul>
    </div>

    <div class="footer-col">
      <h4>Departments</h4>
      <ul>
        <li><a href="#">Cardiology</a></li>
        <li><a href="#">Neurology</a></li>
        <li><a href="#">Orthopaedics</a></li>
        <li><a href="#">Paediatrics</a></li>
        <li><a href="#">Dentistry</a></li>
        <li><a href="#">Ophthalmology</a></li>
      </ul>
    </div>

    <div class="footer-col">
      <h4>Contact Us</h4>
      <div class="footer-contact-item"><span>📍</span><span>123, MG Road, Pune, Maharashtra 411001</span></div>
      <div class="footer-contact-item"><span>📞</span><span>+91 98765 43210</span></div>
      <div class="footer-contact-item"><span>✉️</span><span>care@careplus.in</span></div>
      <div class="footer-contact-item"><span>🕐</span><span>Mon–Sat: 8AM – 9PM</span></div>
      <div class="footer-contact-item"><span>🚨</span><span>Emergency: 24 / 7</span></div>
    </div>

  </div>

  <div class="footer-bottom">
    <span>© 2025 CarePlus Hospital. All Rights Reserved.</span>
    <span>
      <a href="#">Privacy Policy</a> &nbsp;·&nbsp;
      <a href="#">Terms of Use</a> &nbsp;·&nbsp;
      <a href="#">Sitemap</a>
    </span>
  </div>
</footer>

<!-- ══════════════════════════════════════════
     ALL JAVASCRIPT — script.js madhe hote, ata inline ahe
══════════════════════════════════════════ -->
<script>

/* ──────────────────────────────────────────
   1. NAVBAR SCROLL EFFECT
────────────────────────────────────────── */
window.addEventListener('scroll', () => {
  document.getElementById('navbar').classList.toggle('scrolled', window.scrollY > 40);
});

/* ──────────────────────────────────────────
   2. THEME — setTheme / applySavedTheme / toggleTheme
────────────────────────────────────────── */
function setTheme(theme) {
  if (theme === 'light') {
    document.body.classList.add('light');
    localStorage.setItem('theme', 'light');
    document.getElementById('themeToggleBtn').textContent = '☀️';
  } else {
    document.body.classList.remove('light');
    localStorage.setItem('theme', 'dark');
    document.getElementById('themeToggleBtn').textContent = '🌙';
  }
}

function applySavedTheme() {
  let saved = localStorage.getItem('theme');
  if (saved === 'light') {
    setTheme('light');
  } else {
    setTheme('dark');
  }
}

function toggleTheme() {
  let current = localStorage.getItem('theme') || 'dark';
  setTheme(current === 'dark' ? 'light' : 'dark');
}

// Page load hota tevha saved theme apply karo
applySavedTheme();

/* ──────────────────────────────────────────
   3. DOCTOR SEARCH  (doctors.jsp var vaparatay)
────────────────────────────────────────── */
function searchDoctor() {
  let input = document.getElementById('doctorSearch').value.toLowerCase();
  let cards = document.querySelectorAll('.doctor-card');

  cards.forEach(card => {
    let name = card.querySelector('h3').innerText.toLowerCase();
    let spec = card.querySelector('.degree').innerText.toLowerCase();

    if (name.includes(input) || spec.includes(input)) {
      card.style.display = 'block';
    } else {
      card.style.display = 'none';
    }
  });
}

/* ──────────────────────────────────────────
   4. GO TO BOOKING  (doctors.jsp var vaparatay)
────────────────────────────────────────── */
function goToBooking(doctorName) {
  window.location.href = 'book.jsp?doctor=' + encodeURIComponent(doctorName);
}

/* ──────────────────────────────────────────
   5. FILTER DOCTORS  (doctors.jsp var vaparatay)
────────────────────────────────────────── */
function filterDoctors() {
  let spec = document.getElementById('specFilter').value;
  let city = document.getElementById('cityFilter').value;

  let cards = document.querySelectorAll('.doctor-card');

  cards.forEach(card => {
    let cardSpec = card.getAttribute('data-spec');
    let cardCity = card.getAttribute('data-city');

    let matchSpec = spec === '' || cardSpec === spec;
    let matchCity = city === '' || cardCity === city;

    if (matchSpec && matchCity) {
      card.style.display = 'block';
    } else {
      card.style.display = 'none';
    }
  });
}

/* ──────────────────────────────────────────
   6. SHOW MEDICINES  (prescription.jsp var vaparatay)
────────────────────────────────────────── */
function showMedicines() {
  const disease = document.getElementById('disease').value;
  const box     = document.getElementById('medicineBox');
  const list    = document.getElementById('medicineList');

  list.innerHTML = '';

  if (!disease) {
    box.style.display = 'none';
    return;
  }

  const medicines = {
    fever:    ['Paracetamol', 'Crocin', 'Drink warm water'],
    cold:     ['Cetirizine', 'Steam inhalation'],
    headache: ['Ibuprofen', 'Take rest'],
    bp:       ['Amlodipine', 'Low salt diet'],
    diabetes: ['Metformin', 'Avoid sugar']
  };

  medicines[disease].forEach(m => {
    let li = document.createElement('li');
    li.textContent = m;
    list.appendChild(li);
  });

  box.style.display = 'block';
}

/* ──────────────────────────────────────────
   7. SUBMIT EMERGENCY  
────────────────────────────────────────── */
function submitEmergency(event) {
  event.preventDefault();
  alert('🚨 Emergency request received! Help is on the way.');
}

/* ──────────────────────────────────────────
   8. LOAD SLOTS 
────────────────────────────────────────── */
function loadSlots() {
  let doctor = document.querySelector("input[name='doctor']").value;
  let date   = document.querySelector("input[name='adate']").value;

  if (!date) return;

  fetch('GetSlots?doctor=' + doctor + '&date=' + date)
    .then(res => res.json())
    .then(booked => {
      let container = document.querySelector('.time-slots');
      container.innerHTML = '';

      let times = generateSlots();

      times.forEach(time => {
        let btn = document.createElement('button');
        btn.type      = 'button';
        btn.innerText = time;

        if (booked.includes(time)) {
          btn.disabled        = true;
          btn.style.background = '#ccc';
        } else {
          btn.onclick = function () { selectTime(btn); };
        }

        container.appendChild(btn);
      });
    });
}

/* ──────────────────────────────────────────
   9. GENERATE SLOTS 
────────────────────────────────────────── */
function generateSlots() {
  let slots = [];
  let start = 9 * 60;   // 9:00 AM
  let end   = 12 * 60;  // 12:00 PM

  for (let t = start; t < end; t += 10) {
    let h    = Math.floor(t / 60);
    let m    = t % 60;
    let ampm = h >= 12 ? 'PM' : 'AM';
    if (h > 12) h -= 12;

    let time =
      (h < 10 ? '0' + h : h) + ':' +
      (m < 10 ? '0' + m : m) + ' ' + ampm;

    slots.push(time);
  }

  return slots;
}

/* ──────────────────────────────────────────
────────────────────────────────────────── */
function selectTime(btn) {
  document.querySelectorAll('.time-slots button')
    .forEach(b => b.classList.remove('active'));

  btn.classList.add('active');
  document.getElementById('selectedTime').value = btn.innerText;
}

</script>

</body>
</html>
