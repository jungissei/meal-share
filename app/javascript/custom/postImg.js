/*
* Post image
*/
$(document).on('resize turbolinks:load', () =>{
  const postImg = new PostImg;
  postImg.addImgHight();
});

class PostImg{
  constructor(){
    this.selectorImgWrap = '.js-img-wrap';
  }

  /*
  * Add image height attribute and value
  */
  addImgHight(){
    const imgWrap = $(this.selectorImgWrap);
    const imgWrapWidth = imgWrap.width();
    imgWrap.css({'height': `${imgWrapWidth}px`});
  }
}
