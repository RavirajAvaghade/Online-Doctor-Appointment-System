<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String doctor = request.getParameter("doctor");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Appointment | CarePlus</title>
<style>
body {
  margin: 0;
  font-family: 'Poppins', sans-serif;
  background: linear-gradient(135deg, #eef2ff, #dbeafe);
  display: flex;
  justify-content: center;
  align-items: flex-start;
  min-height: 100vh;
  padding: 30px 16px;
}
.form-card {
  background: #ffffff;
  padding: 30px;
  border-radius: 18px;
  width: 100%;
  max-width: 460px;
  box-shadow: 0 15px 40px rgba(0,0,0,0.1);
}
h2 { text-align: center; margin-bottom: 20px; color: #1e3a8a; }
.form-group { margin-bottom: 14px; }
input[type="text"], input[type="email"], input[type="date"] {
  width: 100%;
  padding: 10px 12px;
  border-radius: 10px;
  border: 1px solid #ccc;
  font-size: 14px;
  box-sizing: border-box;
}
.time-section-label {
  font-size: 12px;
  font-weight: 600;
  color: #64748b;
  margin: 12px 0 6px;
}
.hour-row {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 4px;
}
.hour-btn {
  padding: 9px 12px;
  border-radius: 10px;
  border: none;
  background: #3b82f6;
  color: white;
  cursor: pointer;
  font-size: 13px;
  font-weight: 600;
  white-space: nowrap;
}
.hour-btn:hover { background: #2563eb; }
.hour-btn.pm { background: #7c3aed; }
.hour-btn.pm:hover { background: #6d28d9; }
.hour-btn.eve { background: #0891b2; }
.hour-btn.eve:hover { background: #0e7490; }
.sub-slots {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  margin-top: 10px;
}
.sub-slots button {
  padding: 10px 8px;
  border-radius: 8px;
  border: 1px solid #ddd;
  cursor: pointer;
  font-size: 13px;
  background: #f9fafb;
}
.sub-slots button.active {
  background: #16a34a;
  color: white;
  border-color: #16a34a;
}
.sub-slots button.booked-slot {
  background: #fee2e2;
  color: #991b1b;
  cursor: not-allowed;
  font-size: 11px;
  border-color: #fca5a5;
}
.btn {
  width: 100%;
  padding: 13px;
  background: #3b82f6;
  color: white;
  border: none;
  border-radius: 12px;
  cursor: pointer;
  font-size: 15px;
  font-weight: 600;
  margin-top: 16px;
}
.btn:disabled { background: #93c5fd; cursor: not-allowed; }
</style>
</head>
<body>

<div class="form-card">
  <h2>&#128197; Book Appointment</h2>

  <div class="form-group">
    <input type="text" id="name" placeholder="Your Name" required>
  </div>
  <div class="form-group">
    <input type="email" id="email" placeholder="Email" required>
  </div>
  <div class="form-group">
    <input type="text" id="mobile" placeholder="Mobile" required>
  </div>
  <div class="form-group">
    <input type="text" id="doctor"
      value="<%= doctor != null ? doctor : "" %>" readonly
      style="background:#f1f5f9; color:#475569;">
  </div>
  <div class="form-group">
    <input type="date" id="adate" required>
  </div>

  <div class="time-section-label">&#9728; Morning</div>
  <div class="hour-row">
    <button class="hour-btn" type="button" onclick="openHour(9,'AM')">9–10 AM</button>
    <button class="hour-btn" type="button" onclick="openHour(10,'AM')">10–11 AM</button>
    <button class="hour-btn" type="button" onclick="openHour(11,'AM')">11–12 PM</button>
  </div>

  <div class="time-section-label">&#127773; Afternoon</div>
  <div class="hour-row">
    <button class="hour-btn pm" type="button" onclick="openHour(12,'PM')">12–1 PM</button>
    <button class="hour-btn pm" type="button" onclick="openHour(13,'PM')">1–2 PM</button>
    <button class="hour-btn pm" type="button" onclick="openHour(14,'PM')">2–3 PM</button>
    <button class="hour-btn pm" type="button" onclick="openHour(15,'PM')">3–4 PM</button>
    <button class="hour-btn pm" type="button" onclick="openHour(16,'PM')">4–5 PM</button>
  </div>

  <div class="time-section-label">&#127750; Evening</div>
  <div class="hour-row">
    <button class="hour-btn eve" type="button" onclick="openHour(17,'PM')">5–6 PM</button>
    <button class="hour-btn eve" type="button" onclick="openHour(18,'PM')">6–7 PM</button>
    <button class="hour-btn eve" type="button" onclick="openHour(19,'PM')">7–8 PM</button>
  </div>

  <div id="subSlots" class="sub-slots"></div>
  <input type="hidden" id="selectedTime">

  <button class="btn" id="proceedBtn" onclick="goToPayment()" disabled>
    Select a time slot to proceed
  </button>
</div>

<script>
function openHour(hour24, period) {
  var date   = document.getElementById("adate").value;
  var doctor = document.getElementById("doctor").value;

  if (!date) {
    alert("Please Select Date First");
    return;
  }

  var container = document.getElementById("subSlots");
  container.innerHTML = "";

  var booked = JSON.parse(localStorage.getItem("bookedSlots")) || [];

  // Convert to 12-hr display: 12 stays 12, 13->1, 14->2 ... 19->7
  var display12 = (hour24 > 12) ? (hour24 - 12) : hour24;

  for (var i = 0; i < 6; i++) {
    var min    = i * 10;
    var minStr = (min === 0) ? "00" : String(min);

    // e.g. "2:00 PM", "7:30 PM", "9:00 AM"
    var time = display12 + ":" + minStr + " " + period;
    var key  = doctor + "_" + date + "_" + time;

    var btn = document.createElement("button");
    btn.setAttribute("data-time", time);

    if (booked.includes(key)) {
      btn.innerText = time + " (Booked)";
      btn.classList.add("booked-slot");
      btn.disabled = true;
    } else {
      btn.innerText = time;
      btn.onclick = (function(b, t) {
        return function() { selectSlot(b, t); };
      })(btn, time);
    }

    container.appendChild(btn);
  }
}

function selectSlot(btn, time) {
  document.querySelectorAll(".sub-slots button").forEach(function(b) {
    b.classList.remove("active");
  });
  btn.classList.add("active");
  document.getElementById("selectedTime").value = time;

  var proceedBtn = document.getElementById("proceedBtn");
  proceedBtn.disabled = false;
  proceedBtn.innerText = "Pay & Confirm → ₹100";
}

function goToPayment() {
  var name   = document.getElementById("name").value.trim();
  var email  = document.getElementById("email").value.trim();
  var mobile = document.getElementById("mobile").value.trim();
  var doctor = document.getElementById("doctor").value.trim();
  var date   = document.getElementById("adate").value;
  var time   = document.getElementById("selectedTime").value;

  if (!name || !email || !mobile) {
    alert("Please Fill All Information");
    return;
  }
  if (!time) {
    alert("");
    return;
  }

  fetch("BookAppointment", {

	  method:"POST",

	  headers:{
	  "Content-Type":
	  "application/x-www-form-urlencoded"
	  },

	  body:

	  "name="+name+
	  "&email="+email+
	  "&mobile="+mobile+
	  "&doctor="+doctor+
	  "&adate="+date+
	  "&atime="+time

	  })

	  .then(response => response.text())

	  .then(data => {

	  alert(data);

	  if(data.trim() == "SUCCESS")
	  {
	     var pending = {
	     name:name,
	     email:email,
	     mobile:mobile,
	     doctor:doctor,
	     date:date,
	     time:time
	     };

	     sessionStorage.setItem(
	     "pendingBooking",
	     JSON.stringify(pending)
	     );

	     window.location.href =
	     "payment.html";
	  }

	  else
	  {
	     alert("Slot Already Booked");
	  }

	  });
}
</script>
</body>
</html>
