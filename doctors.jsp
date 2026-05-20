<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Our Doctors | CarePlus</title>
</head>
<style>
/* ===== RESET ===== */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* ===== THEME ===== */
:root {
  --navy: #050d1f;
  --deep: #070f24;
  --card: #0c1530;
  --blue: #1a6fff;
  --cyan: #00c2ff;
  --border: rgba(255,255,255,0.07);
  --text: #e8edf5;
  --muted: #7a8499;
  --white: #ffffff;
  --grad: linear-gradient(135deg, #1a6fff, #00c2ff);
}

body {
  font-family: 'DM Sans', sans-serif;
  background: var(--navy);
  color: var(--text);
}

/* ===== NAVBAR ===== */
.navbar {
  position: sticky;
  top: 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 5%;
  background: rgba(5,13,31,0.9);
  backdrop-filter: blur(10px);
  border-bottom: 1px solid var(--border);
  z-index: 100;
}

.navbar h2 { color: white; }

.navbar ul {
  display: flex;
  gap: 15px;
  list-style: none;
  align-items: center;
}

.navbar a {
  color: var(--muted);
  text-decoration: none;
  padding: 6px 10px;
  border-radius: 6px;
}

.navbar a:hover,
.navbar .active {
  color: white;
  background: rgba(255,255,255,0.08);
}

.theme-select {
  padding: 6px 10px;
  background: #0b132d;
  border: 1px solid var(--border);
  color: var(--muted);
  border-radius: 6px;
  cursor: pointer;
}

/* ===== SECTION ===== */
.doctors-section {
  padding: 60px 5%;
  text-align: center;
}

.subtitle {
  color: var(--muted);
  margin-bottom: 30px;
}

/* ===== SEARCH ===== */
.doctor-search input {
  width: 60%;
  padding: 12px 18px;
  border-radius: 10px;
  border: 1px solid var(--border);
  background: #0b132d;
  color: white;
  margin-bottom: 20px;
  font-size: 14px;
  outline: none;
  transition: border-color 0.3s;
}

.doctor-search input:focus {
  border-color: var(--cyan);
}

/* ===== FILTER ===== */
.filters select {
  padding: 10px 14px;
  margin: 10px;
  background: #0b132d;
  border: 1px solid var(--border);
  color: white;
  border-radius: 8px;
  cursor: pointer;
  outline: none;
  transition: border-color 0.3s;
}

.filters select:focus {
  border-color: var(--cyan);
}

/* ===== CITY TABS ===== */
.city-tabs {
  display: flex;
  justify-content: center;
  gap: 10px;
  margin: 20px 0 30px;
  flex-wrap: wrap;
}

.city-tab {
  padding: 8px 22px;
  border-radius: 25px;
  border: 1px solid var(--border);
  background: transparent;
  color: var(--muted);
  cursor: pointer;
  font-size: 14px;
  transition: all 0.3s;
}

.city-tab:hover {
  border-color: var(--cyan);
  color: white;
}

.city-tab.active {
  background: var(--grad);
  border-color: transparent;
  color: white;
  box-shadow: 0 0 15px rgba(0,194,255,0.3);
}

/* ===== GRID ===== */
.doctors-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px,1fr));
  gap: 25px;
  margin-top: 10px;
}

/* ===== CARD ===== */
.doctor-card {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: 18px;
  padding: 25px;
  transition: all 0.3s ease;
  cursor: pointer;
  text-align: center;
  animation: fadeInUp 0.4s ease both;
}

@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(20px); }
  to   { opacity: 1; transform: translateY(0); }
}

.doctor-card:hover {
  transform: translateY(-10px) scale(1.03);
  border-color: var(--cyan);
  box-shadow: 0 25px 60px rgba(0,0,0,0.6),
              0 0 25px rgba(0,194,255,0.3);
}

/* ===== HEADER ===== */
.doctor-header {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
  margin-bottom: 10px;
}

/* ===== AVATAR ===== */
.doctor-avatar {
  width: 70px;
  height: 70px;
  border-radius: 50%;
  background: var(--grad);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 30px;
  box-shadow: 0 0 20px rgba(0,194,255,0.4);
  transition: 0.3s;
}

.doctor-card:hover .doctor-avatar {
  transform: scale(1.1);
  box-shadow: 0 0 30px rgba(0,194,255,0.7);
}

/* ===== BADGE ===== */
.badge {
  font-size: 11px;
  padding: 5px 12px;
  border-radius: 20px;
  background: rgba(26,111,255,0.15);
  color: var(--cyan);
}

/* ===== TEXT ===== */
.degree, .exp, .hospital {
  color: var(--muted);
  font-size: 13px;
  margin: 3px 0;
}

.rating { margin: 10px 0; }

/* ===== AVAILABILITY ===== */
.availability {
  display: inline-block;
  font-size: 12px;
  padding: 3px 10px;
  border-radius: 20px;
  margin: 6px 0;
}

.avail-available {
  background: rgba(0,200,100,0.15);
  color: #00c864;
  border: 1px solid rgba(0,200,100,0.3);
}

.avail-busy {
  background: rgba(255,100,100,0.15);
  color: #ff6464;
  border: 1px solid rgba(255,100,100,0.3);
}

/* ===== BUTTON ===== */
.book-btn {
  width: 100%;
  padding: 12px;
  border: none;
  border-radius: 12px;
  background: var(--grad);
  color: white;
  font-weight: bold;
  cursor: pointer;
  transition: 0.3s;
  margin-top: 10px;
  font-size: 14px;
}

.book-btn:hover {
  opacity: 0.9;
  transform: scale(1.03);
  box-shadow: 0 8px 20px rgba(0,194,255,0.3);
}

/* ===== NO RESULTS ===== */
.no-results {
  display: none;
  text-align: center;
  padding: 60px 20px;
  color: var(--muted);
  font-size: 16px;
  grid-column: 1 / -1;
}

/* ===== FOOTER ===== */
footer {
  background: var(--deep);
  border-top: 1px solid var(--border);
  margin-top: 60px;
  padding: 40px 5%;
  text-align: center;
}

.social-row {
  display: flex;
  justify-content: center;
  gap: 15px;
  margin-bottom: 15px;
}

.social-btn {
  width: 40px;
  height: 40px;
  border-radius: 10px;
  border: 1px solid var(--border);
  background: rgba(255,255,255,0.03);
  color: var(--muted);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 18px;
  cursor: pointer;
  transition: 0.3s;
}

.social-btn:hover {
  background: rgba(26,111,255,0.2);
  border-color: var(--cyan);
  color: white;
  transform: translateY(-3px);
}

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

/* ===== LIGHT THEME ===== */
body.light {
  --navy: #f5f7fb;
  --deep: #ffffff;
  --card: #ffffff;
  --blue: #1a6fff;
  --cyan: #007bff;
  --border: rgba(0,0,0,0.08);
  --text: #1a1a1a;
  --muted: #555;
  background: var(--navy);
  color: var(--text);
}

body.light .navbar {
  background: #ffffff;
  border-bottom: 1px solid var(--border);
}

body.light .navbar a { color: #444; }
body.light .navbar a:hover { color: black; }

body.light .doctor-card {
  background: var(--card);
  box-shadow: 0 10px 25px rgba(0,0,0,0.05);
}

body.light input,
body.light select,
body.light .theme-select {
  background: #fff;
  color: black;
}

body.light footer { background: #ffffff; }

body.light .city-tab {
  border-color: rgba(0,0,0,0.15);
  color: #555;
}

body.light .city-tab:hover { color: #000; }

/* ===== OTHER THEMES ===== */
body.blue-theme {
  --navy: #e8f4fd;
  --card: #ffffff;
  --deep: #d0e8f8;
  --border: rgba(0,100,200,0.12);
  --text: #0a2a4a;
  --muted: #4a7aa0;
  background: var(--navy);
  color: var(--text);
}

body.green-theme {
  --navy: #e8f5e9;
  --card: #ffffff;
  --deep: #c8e6c9;
  --border: rgba(0,150,50,0.12);
  --text: #1b3a1f;
  --muted: #4a7a50;
  background: var(--navy);
  color: var(--text);
}

body.purple-theme {
  --navy: #150a2e;
  --card: #1e1040;
  --deep: #0f0520;
  --border: rgba(150,100,255,0.15);
  --text: #e8e0f5;
  --muted: #9580c0;
  --cyan: #bb86fc;
  --grad: linear-gradient(135deg, #7c4dff, #bb86fc);
  background: var(--navy);
  color: var(--text);
}

body.contrast-theme {
  --navy: #000000;
  --card: #111111;
  --deep: #000000;
  --border: rgba(255,255,0,0.4);
  --text: #ffffff;
  --muted: #ffff00;
  --cyan: #00ffff;
  --grad: linear-gradient(135deg, #ffff00, #00ffff);
  background: var(--navy);
  color: var(--text);
}
</style>

<body onload="protectPage(); applySavedTheme(); loadDoctorAvailability();">

<!-- NAVBAR -->
<nav class="navbar">
  <h2>🏥 CarePlus</h2>
  <ul>
    <li><a href="Home.jsp">Home</a></li>
    <li><a href="doctors.jsp" class="active">Doctors</a></li>
    <li><a href="book.jsp">Book</a></li>
    <li><a href="history.jsp">History</a></li>
    <li><a href="prescription.jsp">Prescription</a></li>
    <li><a href="emergency.jsp">Emergency</a></li>
    <li>
      <select class="theme-select" onchange="setTheme(this.value)">
        <option value="dark">🌙 Dark</option>
        <option value="light">☀ Light</option>
        <option value="blue">🩺 Medical Blue</option>
        <option value="green">🌿 Health Green</option>
        <option value="purple">💜 Purple Premium</option>
        <option value="contrast">♿ High Contrast</option>
      </select>
    </li>
    <li><a href="login.jsp" onclick="logoutUser()">Logout</a></li>
  </ul>
</nav>

<section class="doctors-section">

  <!-- SEARCH -->
  <div class="doctor-search">
    <input id="doctorSearch" type="text"
      placeholder="🔍 Search doctor by name or specialization..."
      oninput="applyFilters()">
  </div>

  <!-- FILTERS -->
  <div class="filters">
    <select id="specializationFilter" onchange="applyFilters()">
      <option value="all">All Specializations</option>
      <option value="Cardiology">Cardiology</option>
      <option value="Orthopedics">Orthopedics</option>
      <option value="Gynecology">Gynecology</option>
      <option value="Pediatrics">Pediatrics</option>
      <option value="Neurology">Neurology</option>
      <option value="Dermatology">Dermatology</option>
      <option value="Surgery">Surgery</option>
      <option value="Psychiatry">Psychiatry</option>
    </select>

    <select id="cityFilter" onchange="applyFilters()">
      <option value="all">All Cities</option>
      <option value="Hyderabad">Hyderabad</option>
      <option value="Pune">Pune</option>
      <option value="Mumbai">Mumbai</option>
      <option value="Solapur">Solapur</option>
    </select>
  </div>

  <!-- CITY TABS -->
  <div class="city-tabs">
    <button class="city-tab active" onclick="setCityTab(this, 'all')">🏙 All Cities</button>
    <button class="city-tab" onclick="setCityTab(this, 'Hyderabad')">🏥 Hyderabad</button>
    <button class="city-tab" onclick="setCityTab(this, 'Pune')">🏥 Pune</button>
    <button class="city-tab" onclick="setCityTab(this, 'Mumbai')">🏥 Mumbai</button>
    <button class="city-tab" onclick="setCityTab(this, 'Solapur')">🏥 Solapur</button>
  </div>

  <h1>Meet Our Expert Doctors</h1>
  <p class="subtitle">20+ specialists across multiple cities</p>

  <div class="doctors-grid" id="doctorsGrid">

    <!-- ================= HYDERABAD (5) ================= -->
    <div class="doctor-card" data-spec="Cardiology" data-city="Hyderabad" data-name="dr. amit sharma">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Cardiology</span>
      </div>
      <h3>Dr. Amit Sharma</h3>
      <p class="degree">MBBS, MD (Cardiology)</p>
      <p class="exp">12+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐☆ (4.5)</div>
      <span class="availability" data-doctor="Dr. Amit Sharma"></span>
      <p class="hospital">CarePlus Hospital, Hyderabad</p>
      <button class="book-btn" onclick="goToBooking('Dr. Amit Sharma')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Orthopedics" data-city="Hyderabad" data-name="dr. rakesh pawar">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Orthopedics</span>
      </div>
      <h3>Dr. Rakesh Pawar</h3>
      <p class="degree">MBBS, MS (Ortho)</p>
      <p class="exp">10+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐⭐ (4.8)</div>
      <span class="availability" data-doctor="Dr. Rakesh Pawar"></span>
      <p class="hospital">CarePlus Hospital, Hyderabad</p>
      <button class="book-btn" onclick="goToBooking('Dr. Rakesh Pawar')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Neurology" data-city="Hyderabad" data-name="dr. anjali mehta">
      <div class="doctor-header">
        <div class="doctor-avatar">👩‍⚕️</div>
        <span class="badge">Neurology</span>
      </div>
      <h3>Dr. Anjali Mehta</h3>
      <p class="degree">MBBS, DM (Neurology)</p>
      <p class="exp">14+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐⭐ (4.9)</div>
      <span class="availability" data-doctor="Dr. Anjali Mehta"></span>
      <p class="hospital">CarePlus Hospital, Hyderabad</p>
      <button class="book-btn" onclick="goToBooking('Dr. Anjali Mehta')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Dermatology" data-city="Hyderabad" data-name="dr. kunal verma">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Dermatology</span>
      </div>
      <h3>Dr. Kunal Verma</h3>
      <p class="degree">MBBS, MD (Dermatology)</p>
      <p class="exp">9+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐ (4.2)</div>
      <span class="availability" data-doctor="Dr. Kunal Verma"></span>
      <p class="hospital">CarePlus Hospital, Hyderabad</p>
      <button class="book-btn" onclick="goToBooking('Dr. Kunal Verma')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Surgery" data-city="Hyderabad" data-name="dr. mahesh kulkarni">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Surgery</span>
      </div>
      <h3>Dr. Mahesh Kulkarni</h3>
      <p class="degree">MBBS, MS (General Surgery)</p>
      <p class="exp">16+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐☆ (4.6)</div>
      <span class="availability" data-doctor="Dr. Mahesh Kulkarni"></span>
      <p class="hospital">CarePlus Hospital, Hyderabad</p>
      <button class="book-btn" onclick="goToBooking('Dr. Mahesh Kulkarni')">Book Appointment</button>
    </div>

    <!-- ================= PUNE (5) ================= -->
    <div class="doctor-card" data-spec="Gynecology" data-city="Pune" data-name="dr. pooja kulkarni">
      <div class="doctor-header">
        <div class="doctor-avatar">👩‍⚕️</div>
        <span class="badge">Gynecology</span>
      </div>
      <h3>Dr. Pooja Kulkarni</h3>
      <p class="degree">MBBS, MS (Gynecology)</p>
      <p class="exp">11+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐☆ (4.5)</div>
      <span class="availability" data-doctor="Dr. Pooja Kulkarni"></span>
      <p class="hospital">CarePlus Hospital, Pune</p>
      <button class="book-btn" onclick="goToBooking('Dr. Pooja Kulkarni')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Pediatrics" data-city="Pune" data-name="dr. sneha joshi">
      <div class="doctor-header">
        <div class="doctor-avatar">👩‍⚕️</div>
        <span class="badge">Pediatrics</span>
      </div>
      <h3>Dr. Sneha Joshi</h3>
      <p class="degree">MBBS, MD (Pediatrics)</p>
      <p class="exp">8+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐ (4.3)</div>
      <span class="availability" data-doctor="Dr. Sneha Joshi"></span>
      <p class="hospital">CarePlus Hospital, Pune</p>
      <button class="book-btn" onclick="goToBooking('Dr. Sneha Joshi')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Cardiology" data-city="Pune" data-name="dr. sameer patil">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Cardiology</span>
      </div>
      <h3>Dr. Sameer Patil</h3>
      <p class="degree">MBBS, DM (Cardiology)</p>
      <p class="exp">13+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐⭐ (4.8)</div>
      <span class="availability" data-doctor="Dr. Sameer Patil"></span>
      <p class="hospital">CarePlus Hospital, Pune</p>
      <button class="book-btn" onclick="goToBooking('Dr. Sameer Patil')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Surgery" data-city="Pune" data-name="dr. nitin desai">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Surgery</span>
      </div>
      <h3>Dr. Nitin Desai</h3>
      <p class="degree">MBBS, MS (Surgery)</p>
      <p class="exp">15+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐☆ (4.6)</div>
      <span class="availability" data-doctor="Dr. Nitin Desai"></span>
      <p class="hospital">CarePlus Hospital, Pune</p>
      <button class="book-btn" onclick="goToBooking('Dr. Nitin Desai')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Psychiatry" data-city="Pune" data-name="dr. kavita more">
      <div class="doctor-header">
        <div class="doctor-avatar">👩‍⚕️</div>
        <span class="badge">Psychiatry</span>
      </div>
      <h3>Dr. Kavita More</h3>
      <p class="degree">MBBS, MD (Psychiatry)</p>
      <p class="exp">9+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐ (4.2)</div>
      <span class="availability" data-doctor="Dr. Kavita More"></span>
      <p class="hospital">CarePlus Hospital, Pune</p>
      <button class="book-btn" onclick="goToBooking('Dr. Kavita More')">Book Appointment</button>
    </div>

    <!-- ================= MUMBAI (5) ================= -->
    <div class="doctor-card" data-spec="Orthopedics" data-city="Mumbai" data-name="dr. rahul patil">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Orthopedics</span>
      </div>
      <h3>Dr. Rahul Patil</h3>
      <p class="degree">MBBS, MS (Ortho)</p>
      <p class="exp">12+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐☆ (4.5)</div>
      <span class="availability" data-doctor="Dr. Rahul Patil"></span>
      <p class="hospital">CarePlus Hospital, Mumbai</p>
      <button class="book-btn" onclick="goToBooking('Dr. Rahul Patil')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Dermatology" data-city="Mumbai" data-name="dr. snehal joshi">
      <div class="doctor-header">
        <div class="doctor-avatar">👩‍⚕️</div>
        <span class="badge">Dermatology</span>
      </div>
      <h3>Dr. Snehal Joshi</h3>
      <p class="degree">MBBS, MD (Dermatology)</p>
      <p class="exp">10+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐ (4.3)</div>
      <span class="availability" data-doctor="Dr. Snehal Joshi"></span>
      <p class="hospital">CarePlus Hospital, Mumbai</p>
      <button class="book-btn" onclick="goToBooking('Dr. Snehal Joshi')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Neurology" data-city="Mumbai" data-name="dr. sanjay kale">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Neurology</span>
      </div>
      <h3>Dr. Sanjay Kale</h3>
      <p class="degree">MBBS, DM (Neurology)</p>
      <p class="exp">17+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐⭐ (4.9)</div>
      <span class="availability" data-doctor="Dr. Sanjay Kale"></span>
      <p class="hospital">CarePlus Hospital, Mumbai</p>
      <button class="book-btn" onclick="goToBooking('Dr. Sanjay Kale')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Surgery" data-city="Mumbai" data-name="dr. ajit deshmukh">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Surgery</span>
      </div>
      <h3>Dr. Ajit Deshmukh</h3>
      <p class="degree">MBBS, MS (Surgery)</p>
      <p class="exp">14+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐☆ (4.6)</div>
      <span class="availability" data-doctor="Dr. Ajit Deshmukh"></span>
      <p class="hospital">CarePlus Hospital, Mumbai</p>
      <button class="book-btn" onclick="goToBooking('Dr. Ajit Deshmukh')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Cardiology" data-city="Mumbai" data-name="dr. vinay shah">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Cardiology</span>
      </div>
      <h3>Dr. Vinay Shah</h3>
      <p class="degree">MBBS, DM (Cardiology)</p>
      <p class="exp">18+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐⭐ (4.8)</div>
      <span class="availability" data-doctor="Dr. Vinay Shah"></span>
      <p class="hospital">CarePlus Hospital, Mumbai</p>
      <button class="book-btn" onclick="goToBooking('Dr. Vinay Shah')">Book Appointment</button>
    </div>

    <!-- ================= SOLAPUR (5) ================= -->
    <div class="doctor-card" data-spec="Pediatrics" data-city="Solapur" data-name="dr. sneha deshmukh">
      <div class="doctor-header">
        <div class="doctor-avatar">👩‍⚕️</div>
        <span class="badge">Pediatrics</span>
      </div>
      <h3>Dr. Sneha Deshmukh</h3>
      <p class="degree">MBBS, MD (Pediatrics)</p>
      <p class="exp">9+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐ (4.4)</div>
      <span class="availability" data-doctor="Dr. Sneha Deshmukh"></span>
      <p class="hospital">CarePlus Hospital, Solapur</p>
      <button class="book-btn" onclick="goToBooking('Dr. Sneha Deshmukh')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Orthopedics" data-city="Solapur" data-name="dr. akash patil">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Orthopedics</span>
      </div>
      <h3>Dr. Akash Patil</h3>
      <p class="degree">MBBS, MS (Ortho)</p>
      <p class="exp">8+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐ (4.1)</div>
      <span class="availability" data-doctor="Dr. Akash Patil"></span>
      <p class="hospital">CarePlus Hospital, Solapur</p>
      <button class="book-btn" onclick="goToBooking('Dr. Akash Patil')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Surgery" data-city="Solapur" data-name="dr. raj joshi">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Surgery</span>
      </div>
      <h3>Dr. Raj Joshi</h3>
      <p class="degree">MBBS, MS (Surgery)</p>
      <p class="exp">13+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐☆ (4.5)</div>
      <span class="availability" data-doctor="Dr. Raj Joshi"></span>
      <p class="hospital">CarePlus Hospital, Solapur</p>
      <button class="book-btn" onclick="goToBooking('Dr. Raj Joshi')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Gynecology" data-city="Solapur" data-name="dr. priti patil">
      <div class="doctor-header">
        <div class="doctor-avatar">👩‍⚕️</div>
        <span class="badge">Gynecology</span>
      </div>
      <h3>Dr. Priti Patil</h3>
      <p class="degree">MBBS, MS (Gynecology)</p>
      <p class="exp">10+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐ (4.3)</div>
      <span class="availability" data-doctor="Dr. Priti Patil"></span>
      <p class="hospital">CarePlus Hospital, Solapur</p>
      <button class="book-btn" onclick="goToBooking('Dr. Priti Patil')">Book Appointment</button>
    </div>

    <div class="doctor-card" data-spec="Dermatology" data-city="Solapur" data-name="dr. nilesh more">
      <div class="doctor-header">
        <div class="doctor-avatar">👨‍⚕️</div>
        <span class="badge">Dermatolog/span>
      </div>
      <h3>Dr. Nilesh More</h3>
      <p class="degree">MBBS, MD (Dermatology)</p>
      <p class="exp">7+ Years Experience</p>
      <div class="rating">⭐⭐⭐⭐ (4.0)</div>
      <span class="availability" data-doctor="Dr. Nilesh More"></span>
      <p class="hospital">CarePlus Hospital, Solapur</p>
      <button class="book-btn" onclick="goToBooking('Dr. Nilesh More')">Book Appointment</button>
    </div>

    <!-- NO RESULTS MESSAGE -->
    <div class="no-results" id="noResults">
      😕 No doctors found matching your search.
    </div>

  </div>
</section>

<footer>
  <div class="footer-inner">

    <div class="footer-brand">
      <a href="Home.jsp" class="nav-brand" style="margin-bottom:2px;display:inline-flex;">
        <div class="nav-logo-box">🏥</div>
        <span class="nav-brand-name" style="font-size:18px;">Care<span>Plus</span></span>
      </a>
      <p>Providing world-class healthcare with compassion and cutting-edge technology since 2010.</p>
      <div class="social-row">
        <a class="social-btn" href="#" title="Facebook">f</a>
        <a class="social-btn" href="#" title="Twitter/X">𝕏</a>
        <a class="social-btn" href="#" title="Instagram">📷</a>
        <a class="social-btn" href="#" title="LinkedIn">in</a>
        <a class="social-btn" href="#" title="YouTube">▶</a>
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

<!-- ===================== ALL JAVASCRIPT INLINE ===================== -->
<script>

/* ===== PAGE PROTECTION ===== */
/* ===== THEME ===== */
var themeClasses = ["light", "blue-theme", "green-theme", "purple-theme", "contrast-theme"];

function setTheme(theme) {
  document.body.classList.remove.apply(document.body.classList, themeClasses);
  if (theme === "light")     document.body.classList.add("light");
  if (theme === "blue")      document.body.classList.add("blue-theme");
  if (theme === "green")     document.body.classList.add("green-theme");
  if (theme === "purple")    document.body.classList.add("purple-theme");
  if (theme === "contrast")  document.body.classList.add("contrast-theme");
  localStorage.setItem("theme", theme);

  // sync dropdown
  var sel = document.querySelector(".theme-select");
  if (sel) sel.value = theme;
}

function applySavedTheme() {
  var saved = localStorage.getItem("theme") || "dark";
  setTheme(saved);
}

/* ===== AVAILABILITY ===== */
function loadDoctorAvailability() {
  var spans = document.querySelectorAll(".availability");
  spans.forEach(function(span) {
    var available = Math.random() > 0.4;
    if (available) {
      span.textContent = "✅ Available Today";
      span.className = "availability avail-available";
    } else {
      span.textContent = "🔴 Busy Today";
      span.className = "availability avail-busy";
    }
  });
}

/* ===== CITY TAB FILTER ===== */
function setCityTab(btn, city) {
  // update tab active state
  document.querySelectorAll(".city-tab").forEach(function(t) {
    t.classList.remove("active");
  });
  btn.classList.add("active");

  // sync dropdown
  var cityDrop = document.getElementById("cityFilter");
  if (cityDrop) cityDrop.value = city;

  applyFilters();
}

/* ===== MAIN FILTER FUNCTION (search + spec + city combined) ===== */
function applyFilters() {
  var searchVal = document.getElementById("doctorSearch").value.trim().toLowerCase();
  var specVal   = document.getElementById("specializationFilter").value;
  var cityVal   = document.getElementById("cityFilter").value;

  var cards   = document.querySelectorAll(".doctor-card");
  var visible = 0;

  cards.forEach(function(card) {
    var name    = card.getAttribute("data-name") || "";          // lowercase already
    var degree  = card.querySelector(".degree").innerText.toLowerCase();
    var spec    = card.getAttribute("data-spec") || "";
    var city    = card.getAttribute("data-city") || "";

    var matchSearch = searchVal === "" || name.includes(searchVal) || degree.includes(searchVal) || spec.toLowerCase().includes(searchVal);
    var matchSpec   = specVal === "all" || spec === specVal;
    var matchCity   = cityVal === "all" || city === cityVal;

    if (matchSearch && matchSpec && matchCity) {
      card.style.display = "block";
      // re-trigger animation
      card.style.animation = "none";
      card.offsetHeight; // reflow
      card.style.animation = "";
      visible++;
    } else {
      card.style.display = "none";
    }
  });

  // show/hide no results message
  var noRes = document.getElementById("noResults");
  if (noRes) noRes.style.display = visible === 0 ? "block" : "none";
}

/* ===== BOOKING ===== */
function goToBooking(doctorName) {
  window.location.href = "book.jsp?doctor=" + encodeURIComponent(doctorName);
}

/* ===== SLOT FUNCTIONS (used on book.jsp but kept here for completeness) ===== */
function generateSlots() {
  var slots = [];
  var start = 9 * 60;
  var end   = 17 * 60;
  for (var t = start; t < end; t += 10) {
    var h    = Math.floor(t / 60);
    var m    = t % 60;
    var ampm = h >= 12 ? "PM" : "AM";
    var h12  = h > 12 ? h - 12 : (h === 0 ? 12 : h);
    var time = (h12 < 10 ? "0" + h12 : h12) + ":" + (m < 10 ? "0" + m : m) + " " + ampm;
    slots.push(time);
  }
  return slots;
}

function loadSlots() {
  var doctorInput = document.querySelector("input[name='doctor']");
  var dateInput   = document.querySelector("input[name='adate']");
  if (!doctorInput || !dateInput || !dateInput.value) return;

  var doctor = doctorInput.value;
  var date   = dateInput.value;

  fetch("GetSlots?doctor=" + encodeURIComponent(doctor) + "&date=" + encodeURIComponent(date))
    .then(function(res) { return res.json(); })
    .then(function(booked) {
      var container = document.querySelector(".time-slots");
      if (!container) return;
      container.innerHTML = "";
      generateSlots().forEach(function(time) {
        var btn = document.createElement("button");
        btn.type = "button";
        btn.innerText = time;
        if (booked.includes(time)) {
          btn.disabled = true;
          btn.style.background = "#ccc";
          btn.style.cursor = "not-allowed";
        } else {
          btn.onclick = function() { selectTime(btn); };
        }
        container.appendChild(btn);
      });
    })
    .catch(function() {
      console.log("GetSlots servlet not available.");
    });
}

function selectTime(btn) {
  document.querySelectorAll(".time-slots button").forEach(function(b) {
    b.classList.remove("active");
  });
  btn.classList.add("active");
  var hidden = document.getElementById("selectedTime");
  if (hidden) hidden.value = btn.innerText;
}

/* ===== MEDICINE / PRESCRIPTION (used on prescription.jsp) ===== */
function showMedicines() {
  var disease = document.getElementById("disease");
  var box     = document.getElementById("medicineBox");
  var list    = document.getElementById("medicineList");
  if (!disease || !box || !list) return;

  list.innerHTML = "";
  if (!disease.value) { box.style.display = "none"; return; }

  var medicines = {
    fever:    ["Paracetamol 500mg", "Crocin", "Drink warm water, rest"],
    cold:     ["Cetirizine 10mg", "Steam inhalation 2x daily"],
    headache: ["Ibuprofen 400mg", "Rest in dark room"],
    bp:       ["Amlodipine 5mg", "Low salt diet"],
    diabetes: ["Metformin 500mg", "Avoid sugar, regular exercise"]
  };

  var meds = medicines[disease.value] || [];
  meds.forEach(function(m) {
    var li = document.createElement("li");
    li.textContent = m;
    list.appendChild(li);
  });

  box.style.display = "block";
}

/* ===== EMERGENCY ===== */
function submitEmergency(event) {
  event.preventDefault();
  alert("🚨 Emergency request received! Help is on the way.");
}

</script>
</body>
</html>
