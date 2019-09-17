document.addEventListener('turbolinks:load', function() {
  var target = document.querySelector('.comparing-sub');

  target.addEventListener('input', conpareInput);
});

function conpareInput() {
  var mainCheck = document.querySelector('.comparing-main').querySelector('.octicon-check');
  var subCheck = document.querySelector('.comparing-sub').querySelector('.octicon-check');
  var subCircleSlash = document.querySelector('.comparing-sub').querySelector('.octicon-circle-slash');
  var main = document.getElementById("user_password").value;
  var sub = document.getElementById("user_password_confirmation").value;

  if (sub == "") {
    mainCheck.classList.add('hide');
    subCheck.classList.add('hide');
    subCircleSlash.classList.add('hide');
  } else { if (sub != main) {
    mainCheck.classList.add('hide');
    subCheck.classList.add('hide');
    subCircleSlash.classList.remove('hide');
  } else {
    mainCheck.classList.remove('hide');
    subCheck.classList.remove('hide');
    subCircleSlash.classList.add('hide');
  }}
}
