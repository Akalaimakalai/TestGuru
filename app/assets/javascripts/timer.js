document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#timer');

  if (control) {
    var test_duration = document.querySelector('#timer').dataset.duration * 60,
        display = document.querySelector('#timer');
    startTimer(test_duration, display);
  };
});

function startTimer(duration, display) {
  var timer = duration, minutes, seconds;
  setInterval(function () {
      minutes = parseInt(timer / 60, 10)
      seconds = parseInt(timer % 60, 10);

      minutes = minutes < 10 ? "0" + minutes : minutes;
      seconds = seconds < 10 ? "0" + seconds : seconds;

      display.textContent = minutes + ":" + seconds;

      if (--timer < 0) {
        document.querySelector('.red-button').click();
      }
  }, 1000);
}
