/*
* Post Status
*/
$(document).on('turbolinks:load', () =>{
  const postStatus = new PostStatus;
  postStatus.displayPostStatus();
  postStatus.hidePostStatus();
  postStatus.chegeText();
});

class PostStatus{
  constructor(){
    this.selectorStatus = '.post-status';
    this.selectorCur = '.post-status__cur';
    this.selectorModal = '.post-status__modal';
    this.selectorRadioBtn = '.post-status__radio-btn';
    this.alertStatus ={
      public: '公開',
      private: '非公開',
    };

  }

  /*
  * Display display post status modal area when current post status is clicked
  */
  displayPostStatus(){
    $(document).on('click', this.selectorCur, event => {
      const selectorCur = $(event.currentTarget);
      selectorCur.next(this.selectorModal).fadeIn(300);
    });
  }

  /*
  * Hide post status modal area when this is clicked
  */
  hidePostStatus(){
    $(document).on('click', event => {
      if($(this.selectorModal).attr('style')){
        return;
      }

      if($(event.target).closest(this.selectorModal).length){
        return;
      }

      $(this.selectorModal).fadeOut(300);
    });
  }

  /*
  * Chenge text when radio button chenged
  */
  chegeText(){
    $(document).on('change', this.selectorRadioBtn, event => {
      $(event.currentTarget).closest(this.selectorStatus).find(this.selectorCur).text(this.alertStatus[event.currentTarget.value]);
    });
  }
}
