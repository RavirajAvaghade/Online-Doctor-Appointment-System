<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Emergency | CarePlus</title>
<link rel="stylesheet" href="Style.css">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet">

<style>
  /* ── RESET & BASE ── */
  *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

  :root {
    --red:     #ff3b3b;
    --red-dim: rgba(255,59,59,0.15);
    --red-glow:rgba(255,59,59,0.35);
    --amber:   #ffb700;
    --bg:      #08090d;
    --surface: #0f1118;
    --card:    #13161f;
    --border:  rgba(255,255,255,0.07);
    --text:    #f0f2f5;
    --muted:   #6b7280;
    --white:   #ffffff;
  }

  html, body {
    background: var(--bg);
    color: var(--text);
    font-family: 'DM Sans', sans-serif;
    min-height: 100vh;
    overflow-x: hidden;
  }

  /* ── ANIMATED BG ── */
  body::before {
    content: '';
    position: fixed; inset: 0; z-index: 0;
    background:
      radial-gradient(ellipse 60% 40% at 15% 10%, rgba(255,59,59,0.08) 0%, transparent 70%),
      radial-gradient(ellipse 50% 40% at 85% 85%, rgba(255,100,0,0.06) 0%, transparent 70%);
    pointer-events: none;
  }

  .page-wrap { position: relative; z-index: 1; max-width: 860px; margin: 0 auto; padding: 0 20px 60px; }

  /* ── HEADER ── */
  .site-header {
    text-align: center;
    padding: 50px 0 10px;
    animation: fadeDown 0.6s ease both;
  }

  .pulse-icon {
    display: inline-flex; align-items: center; justify-content: center;
    width: 72px; height: 72px; border-radius: 50%;
    background: var(--red-dim);
    border: 2px solid rgba(255,59,59,0.4);
    font-size: 32px;
    margin-bottom: 18px;
    position: relative;
  }
  .pulse-icon::after {
    content: '';
    position: absolute; inset: -6px;
    border-radius: 50%;
    border: 2px solid rgba(255,59,59,0.3);
    animation: ping 1.8s ease-out infinite;
  }
  @keyframes ping { 0%{transform:scale(1);opacity:0.7} 100%{transform:scale(1.6);opacity:0} }

  .site-header h1 {
    font-family: 'Syne', sans-serif;
    font-size: clamp(28px, 5vw, 38px);
    font-weight: 800;
    letter-spacing: -1px;
    color: var(--white);
  }
  .site-header h1 span { color: var(--red); }

  .alert-banner {
    display: inline-flex; align-items: center; gap: 8px;
    margin-top: 14px;
    background: rgba(255,59,59,0.1);
    border: 1px solid rgba(255,59,59,0.35);
    border-radius: 40px;
    padding: 8px 20px;
    font-size: 13px;
    font-weight: 600;
    color: #ff6b6b;
    letter-spacing: 0.3px;
    animation: flashBorder 2s ease infinite;
  }
  @keyframes flashBorder {
    0%,100%{ border-color: rgba(255,59,59,0.35); box-shadow: none; }
    50%    { border-color: rgba(255,59,59,0.8); box-shadow: 0 0 12px rgba(255,59,59,0.25); }
  }
  .alert-dot {
    width: 8px; height: 8px; border-radius: 50%;
    background: var(--red);
    animation: blink 1s ease infinite;
  }
  @keyframes blink { 0%,100%{opacity:1} 50%{opacity:0.2} }

  /* ── QUICK CALL BUTTONS ── */
  .call-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 14px;
    margin: 38px 0;
    animation: fadeUp 0.5s 0.1s ease both;
  }

  .call-btn {
    display: flex; flex-direction: column; align-items: center; justify-content: center;
    gap: 8px;
    padding: 22px 12px;
    border-radius: 18px;
    border: 1px solid var(--border);
    background: var(--card);
    color: var(--text);
    text-decoration: none;
    font-family: 'DM Sans', sans-serif;
    cursor: pointer;
    transition: transform 0.2s, box-shadow 0.2s, border-color 0.2s, background 0.2s;
    position: relative; overflow: hidden;
  }
  .call-btn::before {
    content: '';
    position: absolute; inset: 0;
    background: var(--accent-color, transparent);
    opacity: 0;
    transition: opacity 0.2s;
    border-radius: inherit;
  }
  .call-btn:hover { transform: translateY(-3px); }
  .call-btn:hover::before { opacity: 1; }
  .call-btn:active { transform: translateY(0) scale(0.97); }

  .call-btn.ambulance { --accent-color: rgba(255,59,59,0.08); }
  .call-btn.ambulance:hover { border-color: rgba(255,59,59,0.5); box-shadow: 0 8px 28px rgba(255,59,59,0.2); }

  .call-btn.police { --accent-color: rgba(56,139,253,0.08); }
  .call-btn.police:hover { border-color: rgba(56,139,253,0.5); box-shadow: 0 8px 28px rgba(56,139,253,0.2); }

  .call-btn.fire { --accent-color: rgba(255,140,0,0.08); }
  .call-btn.fire:hover { border-color: rgba(255,140,0,0.5); box-shadow: 0 8px 28px rgba(255,140,0,0.2); }

  .call-icon { font-size: 28px; }
  .call-number { font-family: 'Syne', sans-serif; font-size: 26px; font-weight: 800; line-height: 1; }
  .call-label { font-size: 12px; font-weight: 600; color: var(--muted); text-transform: uppercase; letter-spacing: 0.8px; }

  .ambulance .call-number { color: var(--red); }
  .police    .call-number { color: #388bfd; }
  .fire      .call-number { color: #ff8c00; }

  /* ── SECTION CARD ── */
  .card {
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: 20px;
    padding: 32px;
    margin-bottom: 20px;
    animation: fadeUp 0.5s 0.2s ease both;
  }

  .card-title {
    font-family: 'Syne', sans-serif;
    font-size: 18px;
    font-weight: 700;
    color: var(--white);
    margin-bottom: 24px;
    display: flex; align-items: center; gap: 10px;
  }
  .card-title-icon {
    width: 32px; height: 32px; border-radius: 8px;
    background: var(--red-dim);
    display: flex; align-items: center; justify-content: center;
    font-size: 15px;
  }

  /* ── FORM ── */
  .form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 16px;
  }
  .form-full { grid-column: 1 / -1; }

  .field { display: flex; flex-direction: column; gap: 7px; }
  .field label {
    font-size: 12px;
    font-weight: 600;
    color: var(--muted);
    text-transform: uppercase;
    letter-spacing: 0.8px;
  }

  .field input,
  .field select,
  .field textarea {
    background: rgba(255,255,255,0.04);
    border: 1px solid rgba(255,255,255,0.09);
    border-radius: 10px;
    color: var(--text);
    font-family: 'DM Sans', sans-serif;
    font-size: 14px;
    padding: 12px 14px;
    outline: none;
    transition: border-color 0.2s, box-shadow 0.2s;
    width: 100%;
  }
  .field input:focus,
  .field select:focus,
  .field textarea:focus {
    border-color: rgba(255,59,59,0.5);
    box-shadow: 0 0 0 3px rgba(255,59,59,0.1);
  }
  .field input::placeholder,
  .field textarea::placeholder { color: rgba(107,114,128,0.6); }

  .field select option { background: #1a1d27; color: var(--text); }
  .field textarea { resize: vertical; min-height: 90px; }

  .btn-submit {
    width: 100%;
    margin-top: 22px;
    padding: 15px;
    background: var(--red);
    border: none;
    border-radius: 12px;
    color: #fff;
    font-family: 'Syne', sans-serif;
    font-size: 15px;
    font-weight: 700;
    letter-spacing: 0.5px;
    cursor: pointer;
    transition: background 0.2s, transform 0.15s, box-shadow 0.2s;
    box-shadow: 0 6px 24px rgba(255,59,59,0.35);
    display: flex; align-items: center; justify-content: center; gap: 8px;
  }
  .btn-submit:hover { background: #e02020; transform: translateY(-1px); box-shadow: 0 10px 30px rgba(255,59,59,0.45); }
  .btn-submit:active { transform: scale(0.98); }

  /* ── SUCCESS TOAST ── */
  #toast {
    display: none;
    position: fixed; bottom: 30px; left: 50%; transform: translateX(-50%);
    background: #14532d;
    border: 1px solid #166534;
    color: #86efac;
    padding: 14px 28px;
    border-radius: 40px;
    font-size: 14px;
    font-weight: 600;
    z-index: 999;
    box-shadow: 0 8px 30px rgba(0,0,0,0.4);
    animation: toastIn 0.3s ease;
  }
  @keyframes toastIn { from{opacity:0;transform:translateX(-50%) translateY(14px)} to{opacity:1;transform:translateX(-50%) translateY(0)} }

  /* ── TIPS ── */
  .tips-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px;
    animation: fadeUp 0.5s 0.3s ease both;
  }

  .tip-item {
    display: flex; align-items: flex-start; gap: 12px;
    background: rgba(255,255,255,0.025);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 16px;
    transition: border-color 0.2s, background 0.2s;
  }
  .tip-item:hover {
    border-color: rgba(255,183,0,0.3);
    background: rgba(255,183,0,0.04);
  }
  .tip-check {
    width: 24px; height: 24px; border-radius: 50%;
    background: rgba(255,183,0,0.12);
    color: var(--amber);
    display: flex; align-items: center; justify-content: center;
    font-size: 12px;
    flex-shrink: 0;
    margin-top: 1px;
  }
  .tip-text { font-size: 13px; line-height: 1.6; color: #cbd5e1; }

  /* ── DIVIDER ── */
  .section-label {
    font-family: 'Syne', sans-serif;
    font-size: 11px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    color: var(--muted);
    margin: 32px 0 16px;
    display: flex; align-items: center; gap: 10px;
  }
  .section-label::after {
    content: '';
    flex: 1; height: 1px;
    background: var(--border);
  }

  /* ── ANIMATIONS ── */
  @keyframes fadeDown {
    from { opacity: 0; transform: translateY(-20px); }
    to   { opacity: 1; transform: translateY(0); }
  }
  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(20px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* ── RESPONSIVE ── */
  @media (max-width: 560px) {
    .form-grid  { grid-template-columns: 1fr; }
    .tips-grid  { grid-template-columns: 1fr; }
    .call-grid  { grid-template-columns: repeat(3,1fr); gap: 10px; }
    .call-number{ font-size: 22px; }
    .card       { padding: 22px 18px; }
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
  
</style>
</head>

<body onload="protectPage()">

<div class="page-wrap">

  <!-- ── HEADER ── -->
  <div class="site-header">
    <div class="pulse-icon">🚨</div>
    <h1>Emergency <span>Help</span></h1>
    <div class="alert-banner">
      <span class="alert-dot"></span>
      If life-threatening, call 108 immediately!
    </div>
  </div>

  <!-- ── QUICK CALLS ── -->
  <div class="section-label">Quick Dial</div>

  <div class="call-grid">
    <a href="tel:108" class="call-btn ambulance">
      <span class="call-icon">🚑</span>
      <span class="call-number">108</span>
      <span class="call-label">Ambulance</span>
    </a>
    <a href="tel:100" class="call-btn police">
      <span class="call-icon">👮</span>
      <span class="call-number">100</span>
      <span class="call-label">Police</span>
    </a>
    <a href="tel:101" class="call-btn fire">
      <span class="call-icon">🔥</span>
      <span class="call-number">101</span>
      <span class="call-label">Fire</span>
    </a>
  </div>

  <!-- ── REQUEST FORM ── -->
  <div class="section-label">Request Emergency Help</div>

  <div class="card">
    <div class="card-title">
      <div class="card-title-icon">📋</div>
      Emergency Request Form
    </div>

    <form onsubmit="submitEmergency(event)">
      <div class="form-grid">

        <div class="field">
          <label>Patient Name</label>
          <input type="text" placeholder="Full name" required />
        </div>

        <div class="field">
          <label>Mobile Number</label>
          <input type="text" placeholder="+91 XXXXX XXXXX" required />
        </div>

        <div class="field form-full">
          <label>Emergency Type</label>
          <select required>
            <option value="">— Select Emergency Type —</option>
            <option>Accident</option>
            <option>Heart Attack</option>
            <option>Stroke</option>
            <option>Pregnancy Emergency</option>
            <option>Breathing Difficulty</option>
            <option>Severe Bleeding</option>
            <option>Other</option>
          </select>
        </div>

        <div class="field form-full">
          <label>Describe Emergency</label>
          <textarea placeholder="Briefly describe the situation — location, condition, etc."></textarea>
        </div>

      </div>

      <button type="submit" class="btn-submit">
        🚨 Send Emergency Request
      </button>
    </form>
  </div>

  <!-- ── TIPS ── -->
  <div class="section-label">Emergency Tips</div>

  <div class="tips-grid">
    <div class="tip-item">
      <div class="tip-check">✔</div>
      <div class="tip-text">Stay calm and breathe steadily — panic makes situations worse.</div>
    </div>
    <div class="tip-item">
      <div class="tip-check">✔</div>
      <div class="tip-text">Do not move an injured person unless they are in immediate danger.</div>
    </div>
    <div class="tip-item">
      <div class="tip-check">✔</div>
      <div class="tip-text">Apply firm pressure to stop bleeding using a clean cloth.</div>
    </div>
    <div class="tip-item">
      <div class="tip-check">✔</div>
      <div class="tip-text">Keep the patient conscious by talking to them continuously.</div>
    </div>
  </div>

</div><!-- /page-wrap -->
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
<!-- ── TOAST ── -->
<div id="toast">✅ Emergency request sent successfully!</div>

<script src="script.js"></script>
<script>
  function submitEmergency(e) {
    e.preventDefault();
    const toast = document.getElementById('toast');
    toast.style.display = 'block';
    setTimeout(() => { toast.style.display = 'none'; }, 3500);
    e.target.reset();
  }
</script>

</body>
</html>
