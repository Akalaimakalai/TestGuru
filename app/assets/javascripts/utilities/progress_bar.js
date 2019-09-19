document.addEventListener('turbolinks:load', function(){
  var bar = document.getElementById("myProgress");

  if (bar) {
    move();
  }
});

function move() {
  var elem = document.getElementById("myBar"); 
  var width = document.querySelector('.barrgot').dataset.width;
  elem.style.width = width; 
}
