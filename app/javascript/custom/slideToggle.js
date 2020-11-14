/*
* Slide Toggle
*/
$(document).on('turbolinks:load', () =>{
  $('.block-toggle__press-btn').on('click', event =>{
    $(event.currentTarget).parent('.block-toggle__press').next('.block-toggle__content').slideToggle(700);
  });
});
