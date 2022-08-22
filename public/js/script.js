var time = document.getElementById("visual_quiz_timer");
var timerLength = time.textContent;

setTimeout(timeout, parseInt(timerLength)*1000);

var timeText = setInterval(function() {
    time.textContent = time.textContent - 1;
}, 1000);

function timeout() {
    window.location.href = "/svar";
}