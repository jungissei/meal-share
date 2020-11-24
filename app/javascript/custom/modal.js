/*
* Modal
*/
$(document).on('turbolinks:load', () =>{
  const postStatus = new Modal;
  postStatus.displayContent();
  postStatus.hideContent();
});

class Modal{
  constructor(){
    this.selectorWrap = '.modal-area';
    this.selectorBtn = '.modal-area__btn';
    this.selectorContent = '.modal-area__content';

  }

  /*
  * Display display modal area when button is clicked
  */
  displayContent(){
    $(document).on('click', this.selectorBtn, event => {
      const selectorCur = $(event.currentTarget);
      selectorCur.closest(this.selectorWrap).addClass('is_active');
      selectorCur.next(this.selectorContent).fadeIn(300);
    });
  }

  /*
  * Hide modal area when window area is clicked
  */
  hideContent(){
    $(document).on('click', event => {
      if($(this.selectorContent).attr('style')){
        return;
      }

      if($(event.target).closest(this.selectorContent).length){
        return;
      }

      $(this.selectorContent).closest(this.selectorWrap).removeClass('is_active');
      $(this.selectorContent).fadeOut(300);
    });
  }
}
