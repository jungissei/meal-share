class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation, :remember_me])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password, :image, :image_cache, :name])
    end


    # Call the method to get the uploaded image
    def get_uploaded_image(image, method = "thumb")
      self.send(method.to_sym, image)
    end
    helper_method :get_uploaded_image

    # Returns the value of the src attribute of
    # the img tag of the thumbnail size image.
    def thumb(image)
      image.thumb.url.to_s
    end

    # Returns the value of the src attribute of
    # the img tag for a medium-sized thumbnail image.
    def medium_thumb(image)
      image.medium_thumb.url.to_s
    end

    # Returns the value of the src attribute
    # of the img tag for a small-sized thumbnail image.
    def small_thumb(image)
      image.small_thumb.url.to_s
    end
end
