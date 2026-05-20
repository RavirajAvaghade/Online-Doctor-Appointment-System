<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>AI Doctor Assistant</title>
<style>
* { box-sizing: border-box; margin: 0; padding: 0; }

body {
  font-family: Arial, sans-serif;
  background: var(--bg, #f0f4f8);
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: #e8f0fe;
}

.card {
  background: white;
  border-radius: 20px;
  width: 420px;
  overflow: hidden;
  box-shadow: 0 8px 32px rgba(24, 95, 165, 0.13);
  display: flex;
  flex-direction: column;
}

.header {
  background: #185FA5;
  padding: 18px 20px 14px;
  display: flex;
  align-items: center;
  gap: 12px;
}

.header-icon {
  width: 42px;
  height: 42px;
  border-radius: 50%;
  background: rgba(255,255,255,0.18);
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}

.header-icon svg { width: 22px; height: 22px; fill: white; }

.header-title { color: white; font-size: 16px; font-weight: 600; }

.header-sub {
  color: rgba(255,255,255,0.72);
  font-size: 11.5px;
  margin-top: 2px;
}

.chat-area {
  height: 300px;
  overflow-y: auto;
  padding: 16px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  background: #f5f8ff;
}

.chat-area::-webkit-scrollbar { width: 4px; }
.chat-area::-webkit-scrollbar-track { background: transparent; }
.chat-area::-webkit-scrollbar-thumb { background: #b5d4f4; border-radius: 4px; }

.msg-user { display: flex; justify-content: flex-end; }
.msg-bot  { display: flex; justify-content: flex-start; align-items: flex-start; gap: 8px; }

.bot-avatar {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  background: #e6f1fb;
  border: 1px solid #b5d4f4;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  margin-top: 2px;
}

.bot-avatar svg { width: 15px; height: 15px; fill: #185FA5; }

.bubble-user {
  background: #185FA5;
  color: white;
  padding: 9px 14px;
  border-radius: 16px 16px 4px 16px;
  font-size: 13.5px;
  max-width: 75%;
  line-height: 1.5;
}

.bubble-bot {
  background: white;
  border: 1px solid #dce8f5;
  color: #1a1a2e;
  padding: 9px 14px;
  border-radius: 16px 16px 16px 4px;
  font-size: 13.5px;
  max-width: 82%;
  line-height: 1.5;
}

.rx-card {
  background: #e6f1fb;
  border: 1px solid #b5d4f4;
  border-radius: 10px;
  padding: 10px 12px;
  margin-top: 8px;
}

.rx-label {
  font-size: 11px;
  font-weight: 700;
  color: #185FA5;
  text-transform: uppercase;
  letter-spacing: 0.6px;
  margin-bottom: 7px;
}

.rx-item {
  display: flex;
  align-items: flex-start;
  gap: 7px;
  margin-bottom: 5px;
  color: #0c447c;
  font-size: 13px;
  line-height: 1.45;
}

.rx-dot {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: #185FA5;
  margin-top: 5px;
  flex-shrink: 0;
}

.rx-warn {
  font-size: 11.5px;
  color: #7a4b0a;
  background: #fef3e2;
  border: 1px solid #f9c66b;
  border-radius: 7px;
  padding: 6px 9px;
  margin-top: 7px;
  line-height: 1.4;
}

.input-row {
  padding: 12px 14px;
  border-top: 1px solid #e8eef6;
  display: flex;
  gap: 8px;
  background: white;
  align-items: center;
}

.inp {
  flex: 1;
  border: 1px solid #cddcf0;
  border-radius: 20px;
  padding: 9px 15px;
  font-size: 13.5px;
  background: #f5f8ff;
  color: #1a1a2e;
  outline: none;
  transition: border-color 0.2s;
}

.inp:focus { border-color: #185FA5; background: white; }

.send-btn {
  background: #185FA5;
  color: white;
  border: none;
  border-radius: 50%;
  width: 38px;
  height: 38px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  transition: background 0.2s;
}

.send-btn:hover { background: #0c447c; }
.send-btn svg { width: 16px; height: 16px; fill: white; }

.quick-area {
  padding: 10px 14px 15px;
  background: white;
  border-top: 1px solid #e8eef6;
}

.quick-label {
  font-size: 10.5px;
  color: #7a8fa6;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.6px;
  margin-bottom: 8px;
}

.quick-btns { display: flex; gap: 7px; flex-wrap: wrap; }

.qbtn {
  background: #f5f8ff;
  border: 1px solid #cddcf0;
  color: #3a5a7a;
  border-radius: 20px;
  padding: 6px 13px;
  font-size: 12.5px;
  cursor: pointer;
  transition: all 0.2s;
  display: flex;
  align-items: center;
  gap: 5px;
}

.qbtn:hover {
  background: #e6f1fb;
  border-color: #185FA5;
  color: #0c447c;
}
</style>
</head>
<body>

<div class="card">

  <div class="header">
    <div class="header-icon">
      <svg viewBox="0 0 24 24"><path d="M12 2a10 10 0 100 20A10 10 0 0012 2zm1 13h-2v-2h2v2zm0-4h-2V7h2v4z"/></svg>
    </div>
    <div>
      <div class="header-title">AI Doctor Assistant</div>
      <div class="header-sub">Symptom checker — not a substitute for real care</div>
    </div>
  </div>

  <div class="chat-area" id="chat"></div>

  <div class="input-row">
    <input class="inp" id="input" placeholder="Describe your symptoms..." />
    <button class="send-btn" onclick="send()">
      <svg viewBox="0 0 24 24"><path d="M2 21l21-9L2 3v7l15 2-15 2z"/></svg>
    </button>
  </div>

  <div class="quick-area">
    <div class="quick-label">Quick symptoms</div>
    <div class="quick-btns">
      <button class="qbtn" onclick="sendQuick('cold')">🤧 Cold</button>
      <button class="qbtn" onclick="sendQuick('fever')">🌡️ Fever</button>
      <button class="qbtn" onclick="sendQuick('headache')">🤕 Headache</button>
      <button class="qbtn" onclick="sendQuick('stomach pain')">😣 Stomach pain</button>
      <button class="qbtn" onclick="sendQuick('sore throat')">😷 Sore throat</button>
    </div>
  </div>

</div>

<script>

let messages = [
  { role: "bot", text: "Hello! I'm your AI health assistant. Please describe your symptoms and I'll suggest a prescription.", rx: null }
];

function getRx(msg) {
  msg = msg.toLowerCase();

  if (msg.includes("cold") || msg.includes("cough") || msg.includes("runny")) {
    return {
      title: "Common Cold / Cough",
      items: [
        "Cetirizine 10mg — once daily (night)",
        "Steam inhalation — 2x daily",
        "Warm saline gargles — 3x daily",
        "Warm water / ginger tea — throughout day"
      ],
      warn: "Consult a doctor if symptoms persist beyond 5 days."
    };
  } else if (msg.includes("fever")) {
    return {
      title: "Fever",
      items: [
        "Paracetamol 500mg — every 6 hrs if temp > 38°C",
        "Cold compress on forehead",
        "ORS / fluids — stay hydrated",
        "Rest — avoid physical exertion"
      ],
      warn: "Seek immediate care if fever exceeds 103°F / 39.4°C."
    };
  } else if (msg.includes("headache")) {
    return {
      title: "Headache",
      items: [
        "Paracetamol 500mg — as needed (max 3/day)",
        "Rest in a quiet, dark room",
        "Stay hydrated — drink water",
        "Avoid screen time for 1–2 hrs"
      ],
      warn: "See a doctor if headache is sudden, severe, or recurring."
    };
  } else if (msg.includes("stomach") || msg.includes("nausea") || msg.includes("vomit")) {
    return {
      title: "Stomach Pain / Nausea",
      items: [
        "Domperidone 10mg — before meals",
        "ORS sachets — stay hydrated",
        "BRAT diet: banana, rice, applesauce, toast",
        "Avoid spicy / oily food for 24 hrs"
      ],
      warn: "Visit a clinic if pain is sharp or lasts more than 2 days."
    };
  } else if (msg.includes("throat") || msg.includes("sore")) {
    return {
      title: "Sore Throat",
      items: [
        "Warm saline gargle — 4x daily",
        "Strepsils / throat lozenges — as needed",
        "Honey + ginger in warm water",
        "Ibuprofen 400mg if pain is moderate"
      ],
      warn: "See a doctor if white patches visible or fever develops."
    };
  } else if (msg.includes("back") || msg.includes("joint") || msg.includes("muscle")) {
    return {
      title: "Body Pain / Muscle Ache",
      items: [
        "Ibuprofen 400mg — after food, twice daily",
        "Warm compress on affected area",
        "Light stretching / rest",
        "Volini / pain relief gel topically"
      ],
      warn: "Consult a doctor if pain is severe or lasts more than 1 week."
    };
  }

  return null;
}

function buildBubble(m) {
  if (m.role === "user") {
    return "<div class='msg-user'><div class='bubble-user'>" + m.text + "</div></div>";
  }

  let inner = "<div class='bubble-bot'>" + m.text;

  if (m.rx) {
    inner += "<div class='rx-card'>";
    inner += "<div class='rx-label'>Rx — " + m.rx.title + "</div>";
    for (let i = 0; i < m.rx.items.length; i++) {
      inner += "<div class='rx-item'><div class='rx-dot'></div><div>" + m.rx.items[i] + "</div></div>";
    }
    inner += "<div class='rx-warn'>&#9888; " + m.rx.warn + "</div>";
    inner += "</div>";
  }

  inner += "</div>";

  return "<div class='msg-bot'><div class='bot-avatar'><svg viewBox='0 0 24 24'><path d='M12 2a10 10 0 100 20A10 10 0 0012 2zm1 13h-2v-2h2v2zm0-4h-2V7h2v4z'/></svg></div>" + inner + "</div>";
}

function render() {
  let c = document.getElementById("chat");
  c.innerHTML = messages.map(buildBubble).join("");
  c.scrollTop = c.scrollHeight;
}

function respond(text) {
  let rx = getRx(text);
  let reply = rx
    ? "Here's a suggested prescription for your symptoms:"
    : "I'm not sure about that symptom. Please try: cold, fever, headache, stomach pain, or sore throat.";
  messages.push({ role: "bot", text: reply, rx: rx });
  render();
}

function send() {
  let el = document.getElementById("input");
  let text = el.value.trim();
  if (!text) return;
  messages.push({ role: "user", text: text, rx: null });
  el.value = "";
  render();
  setTimeout(function() { respond(text); }, 400);
}

function sendQuick(txt) {
  document.getElementById("input").value = txt;
  send();
}

document.getElementById("input").addEventListener("keypress", function(e) {
  if (e.key === "Enter") send();
});

render();

</script>

</body>
</html>
