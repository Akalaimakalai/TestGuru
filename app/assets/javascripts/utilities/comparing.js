document.addEventListener('turbolinks:load', function() {
  var target = document.querySelector('.comparing-sub');

  target.addEventListener('input', conpareInput);
});

function conpareInput() {
  var mainfield = document.querySelector('.comparing-main');
  var main = document.getElementById("user_password").value;
  var sub = document.getElementById("user_password_confirmation").value;

  if (sub == "") {
    mainfield.querySelector('.octicon-check').classList.add('hide')
    this.querySelector('.octicon-check').classList.add('hide')
    this.querySelector('.octicon-circle-slash').classList.add('hide')
  } else { if (sub != main) {
    this.querySelector('.octicon-circle-slash').classList.remove('hide')
  } else {
    mainfield.querySelector('.octicon-check').classList.remove('hide')
    this.querySelector('.octicon-check').classList.remove('hide')
    this.querySelector('.octicon-circle-slash').classList.add('hide')
  }}
}
