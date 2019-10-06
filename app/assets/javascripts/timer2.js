document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById('timer2');

  if (control) {
    var deadline = document.getElementById('clockdiv').dataset.duration;
    if (deadline) {
      initializeClock('clockdiv', deadline);
    } else {
      control.classList.add('hide');
    };
  };
});

function getTimeRemaining(endtime){
  var t = Date.parse(endtime) - Date.parse(new Date());
  var seconds = Math.floor( (t/1000) % 60 );
  var minutes = Math.floor( (t/1000/60) % 60 );
  var hours = Math.floor( (t/(1000*60*60)) % 24 );
  var days = Math.floor( t/(1000*60*60*24) );
  return {
   'total': t,
   'days': days,
   'hours': hours,
   'minutes': minutes,
   'seconds': seconds
  };
}

function initializeClock(id, endtime){
  var clock = document.getElementById(id);
  var timeinterval = setInterval(function(){
   var t = getTimeRemaining(endtime);
   clock.innerHTML = + t.minutes + ':' + t.seconds;
   if(t.total<=0){
    document.querySelector('.red_button').click();
   }
  },1000);
}
