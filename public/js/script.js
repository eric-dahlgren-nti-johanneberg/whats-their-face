var timerLength = document.getElementById("quiz_timer").textContent;
var timeText = document.getElementById("visual_quiz_timer")

setTimeout(timeout, parseInt(timerLength)*1000);

var time = setInterval(function() {
    timeText.textContent = timeText.textContent - 1;
}, 1000);

function timeout() {
    window.location.href = "/svar";
}