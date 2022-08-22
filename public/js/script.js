var time = document.getElementById("visual_quiz_timer");
var timerLength = time.innerHTML;

setTimeout(timeout, parseInt(timerLength)*1000);

var timeText = setInterval(function() {
    time.innerHTML = time.innerHTML - 1;
}, 1000);

function timeout() {
    window.location.href = "/svar";
}