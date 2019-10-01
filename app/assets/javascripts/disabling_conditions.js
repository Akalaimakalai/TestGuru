document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById('badge_condition');

  if (control) {
    control.addEventListener('click', DisableField);
  };
});

function DisableField() {
  var choice = this.value;
  var categories = document.querySelector('.categories_list');
  var levels = document.querySelector('.levels_list');
  var category = categories.querySelector('select[name="badge[additional_condition]"]');
  var level = levels.querySelector('input[name="badge[additional_condition]"]');



  if (choice == "category_complited") {
    category.removeAttribute("disabled");
    categories.classList.remove('hide');
    level.setAttribute('disabled', true);
    levels.classList.add('hide');
  } else { if (choice == "level_complited") {
    category.setAttribute('disabled', true);
    categories.classList.add('hide');
    level.removeAttribute("disabled");
    levels.classList.remove('hide');
    };
  };
};
