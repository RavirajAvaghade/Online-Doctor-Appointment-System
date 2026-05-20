function searchDoctor() {
  let input = document.getElementById("doctorSearch").value.toLowerCase();
  let cards = document.querySelectorAll(".doctor-card");

  cards.forEach(card => {
    let name = card.querySelector("h3").innerText.toLowerCase();
    let spec = card.querySelector(".degree").innerText.toLowerCase();

    if (name.includes(input) || spec.includes(input)) {
      card.style.display = "block";
    } else {
      card.style.display = "none";
    }
  });
}

function goToBooking(doctorName) {
  window.location.href = "book.jsp?doctor=" + encodeURIComponent(doctorName);
}
function filterDoctors() {
  let spec = document.getElementById("specFilter").value;
  let city = document.getElementById("cityFilter").value;

  let cards = document.querySelectorAll(".doctor-card");

  cards.forEach(card => {
    let cardSpec = card.getAttribute("data-spec");
    let cardCity = card.getAttribute("data-city");

    let matchSpec = spec === "" || cardSpec === spec;
    let matchCity = city === "" || cardCity === city;

    if (matchSpec && matchCity) {
      card.style.display = "block";
    } else {
      card.style.display = "none";
    }
  });
}
function showMedicines() {
  const disease = document.getElementById("disease").value;
  const box = document.getElementById("medicineBox");
  const list = document.getElementById("medicineList");

  list.innerHTML = "";

  if (!disease) {
    box.style.display = "none";
    return;
  }

  const medicines = {
    fever: ["Paracetamol", "Crocin", "Drink warm water"],
    cold: ["Cetirizine", "Steam inhalation"],
    headache: ["Ibuprofen", "Take rest"],
    bp: ["Amlodipine", "Low salt diet"],
    diabetes: ["Metformin", "Avoid sugar"]
  };

  medicines[disease].forEach(m => {
    let li = document.createElement("li");
    li.textContent = m;
    list.appendChild(li);
  });

  box.style.display = "block";
}
function submitEmergency(event) {
  event.preventDefault();
  alert("🚨 Emergency request received! Help is on the way.");
}
function loadSlots() {

  let doctor = document.querySelector("input[name='doctor']").value;
  let date = document.querySelector("input[name='adate']").value;

  if (!date) return;

  fetch("GetSlots?doctor=" + doctor + "&date=" + date)
    .then(res => res.json())
    .then(booked => {

      let container = document.querySelector(".time-slots");
      container.innerHTML = "";

      let times = generateSlots();

      times.forEach(time => {

        let btn = document.createElement("button");
        btn.type = "button";
        btn.innerText = time;

        if (booked.includes(time)) {
          btn.disabled = true;
          btn.style.background = "#ccc";
        } else {
          btn.onclick = function() { selectTime(btn); };
        }

        container.appendChild(btn);
      });

    });
}
function generateSlots() {

  let slots = [];

  let start = 9 * 60;   // 9:00 AM
  let end = 12 * 60;    // 12:00 PM

  for (let t = start; t < end; t += 10) {
    let h = Math.floor(t / 60);
    let m = t % 60;

    let ampm = h >= 12 ? "PM" : "AM";
    if (h > 12) h -= 12;

    let time = 
      (h < 10 ? "0" + h : h) + ":" +
      (m < 10 ? "0" + m : m) + " " + ampm;

    slots.push(time);
  }

  return slots;
}
function selectTime(btn) {

  document.querySelectorAll(".time-slots button")
    .forEach(b => b.classList.remove("active"));

  btn.classList.add("active");

  document.getElementById("selectedTime").value = btn.innerText;
}
function setTheme(theme) {
  if (theme === "light") {
    document.body.classList.add("light");
    localStorage.setItem("theme", "light");
  } else {
    document.body.classList.remove("light");
    localStorage.setItem("theme", "dark");
  }
}

function applySavedTheme() {
  let saved = localStorage.getItem("theme");

  if (saved === "light") {
    document.body.classList.add("light");
  }
}