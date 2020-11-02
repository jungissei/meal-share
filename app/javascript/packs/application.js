// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


/*Slide Toggle
------------------------------------------------------*/
$(document).on('turbolinks:load', () =>{
  $('.block-toggle__press .btn').on('click', event =>{
    $(event.currentTarget).parent('.block-toggle__press').next('.block-toggle__content').slideToggle(700);
  });
});

/*Image uplorader
------------------------------------------------------*/
$(document).on('turbolinks:load', () =>{

  const imgUplorader = new ImgUplorader;
  imgUplorader.copyToSaveInput();

});

class ImgUplorader{
  constructor(){
    this.selectorPreview = '.form-image-uploader__preview';
    this.selectorSave = '.form-image-uploader__save';
    this.selectorCache = '.form-image-uploader__cache';
    this.noPhotoImgPath = '/assets/nophoto-e1a743df0c155237d2677a50919e83279a8002ff93f24727582e52ffb2347dd1.jpg';

  }

  /*
  * Change preview image to nophoto image when image is not selected
  * @param input : Element of current target
  */
  copyToSaveInput(){
    $(document).on('change', this.selectorSave, event => {

      const input = $(event.currentTarget);
      const filesLength = input[0].files.length;
      const cacheDefaultVal = $(input).next(this.selectorCache)[0].defaultValue;


      // Change preview image to nophoto image when image is not selected
      if (this.hasNotImg(filesLength)) {
        this.changeNoPhotoImg(input);
        return;
      }

      // Change preview image to selected image when image is selected
      this.changeSelectedImg(input);

    });
  }

  /*
   * Return true when input doesn't have file
   * @param filesLength : file length of input
   * @return bool
  */
  hasCacheDefaultImg(filesLength){
    if(filesLength == 0){
      return true;
    }

    return false;
  }

  /*
   * Return true when input doesn't have file
   * @param filesLength : file length of input
   * @return bool
  */
  hasNotImg(filesLength){
    if(filesLength == 0){
      return true;
    }

    return false;
  }

  /*
   * Change preview image to nophoto image when image is not selected
   * @param input : Element of current target
  */
  changeNoPhotoImg(input){
    $(input).prev(this.selectorImg).children('img').attr('src', this.noPhotoImgPath);
  }

  /*
   * Change preview image to selected image when image is selected
   * @param input : Element of current target
  */
  changeSelectedImg(input){
    const reader = new FileReader();
    reader.onload = (progressEvent) => {
      $(input).prev(this.selectorImg).children('img').attr('src', progressEvent.currentTarget.result);
    }

    const file = input[0].files[0];
    reader.readAsDataURL(file);
  }
}
