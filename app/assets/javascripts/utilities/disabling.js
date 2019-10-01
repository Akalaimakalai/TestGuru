document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById('badge_condition');

  if (control) {
    control.addEventListener('click', DisableField);
  };
});

function DisableField() {
  var choice = this.value;
  var categories = document.querySelector('.categories_list');
  var levles = document.querySelector('.levels_list');


  if (choice == "category_complited") {
    categories.setAttribute('disabled', false);
    categories.classList.remove('hide');
    levles.setAttribute('disabled', true);
    levles.classList.add('hide');
  } else { if (choice == "level_complited") {
    categories.setAttribute('disabled', true);
    categories.classList.add('hide');
    levles.setAttribute('disabled', false);
    levles.classList.remove('hide');
    };
  };
};
