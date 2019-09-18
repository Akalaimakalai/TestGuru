document.addEventListener('turbolinks:load', function(){
  var bar = document.getElementById("myProgress");

  if (bar) {
    move();
  }
});

function move() {
  var elem = document.getElementById("myBar"); 
  var width = document.querySelector('.barrgot[data-width="start"]').textContent;
  elem.style.width = width; 
}
