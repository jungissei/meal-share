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
      const clickedSelectorWrap = $(event.currentTarget).closest(this.selectorWrap);
      $(this.selectorWrap).each((i, elem) =>{
        if($(elem).children(this.selectorContent).attr('style')){
          return true;
        }

        if($(elem) != clickedSelectorWrap){
          $(elem).removeClass('is_active');
          $(elem).children(this.selectorContent).fadeOut(300);
        }
      });
    });
  }
}
