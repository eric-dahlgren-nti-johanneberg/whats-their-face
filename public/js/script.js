
if (window.location.pathname == "/"){
    var time_value = document.getElementById("timer");
    var display_time_value = document.getElementById("display_timer");

    time_value.oninput = function(){
        display_time_value.innerHTML = "Time per person: " + this.value;
    }
}

if (window.location.pathname == "/quiz"){
    var time = document.getElementById("visual_quiz_timer");
    var timerLength = time.innerHTML;

    setTimeout(timeout, parseInt(timerLength)*1000);

    var timeText = setInterval(function() {
        time.innerHTML = time.innerHTML - 1;
        if(time.innerHTML < 6){
            time.style.color = "red";
        }
    }, 1000);
}

function timeout() {
    window.location.href = "/timeout";
}

