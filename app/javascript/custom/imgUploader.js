/*
* Image uploader
*/
$(document).on('turbolinks:load', () =>{

  const imgUplorader = new ImgUplorader;
  imgUplorader.copyToSaveInput();
  imgUplorader.resetPreview();

});

class ImgUplorader{
  constructor(){
    this.selectorWrapAll = '.form-image-uploader';
    this.selectorPreviewImg = '.form-image-uploader__preview-img';
    this.selectorSave = '.form-image-uploader__save';
    this.selectorCache = '.form-image-uploader__cache';
    this.selectorLabel = '.form-image-uploader__label';
    this.selectorCancel = '.form-image-uploader__cancel';
    this.noPhotoImgPath = '/assets/nophoto-e1a743df0c155237d2677a50919e83279a8002ff93f24727582e52ffb2347dd1.jpg';

  }

  /*
  * Change preview image to nophoto image when image is not selected
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
   * @param selector : Element of current target
  */
  changeNoPhotoImg(selector){
    $(selector).closest(this.selectorWrapAll).find(this.selectorLabel).text('画像選択...');
    $(selector).closest(this.selectorWrapAll).find(this.selectorPreviewImg).attr('src', this.noPhotoImgPath);
  }

  /*
   * Change preview image to selected image when image is selected
   * @param input : Element of current target
  */
  changeSelectedImg(input){
    const reader = new FileReader();
    reader.onload = (progressEvent) => {
      $(input).closest(this.selectorWrapAll).find(this.selectorPreviewImg).attr('src', progressEvent.currentTarget.result);
    }

    const file = input[0].files[0];
    $(input).closest(this.selectorWrapAll).find(this.selectorLabel).text(file.name);
    reader.readAsDataURL(file);
  }

  /*
  * Reset preview image, input, label
  */
  resetPreview(){
    $(document).on('click', this.selectorCancel, event => {

      const cancelBtn = $(event.currentTarget);

      //Make input value empty
      $(cancelBtn).closest(this.selectorWrapAll).find(this.selectorSave).val('');

      // Change preview image to nophoto image
      this.changeNoPhotoImg(cancelBtn);

    });
  }
}
