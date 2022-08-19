var timer = document.getElementById("quiz_timer").textContent;

if (typeof(timer) != typeof(null)) {
    setTimeout(timeout, parseInt(timer)*1000);
    
    var time = setInterval(function() {
        document.getElementById("visual_quiz_timer").textContent = document.getElementById("visual_quiz_timer").textContent - 1;
    }, 1000);
}

function timeout() {
    window.location.href = "/svar";
}