module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :zipcode, :gender, :avatar]
    devise_parameter_sanitizer.for(:account_update) << [:name, :zipcode, :gender, :avatar]
  end

end

DeviseController.send :include, DevisePermittedParameters




  