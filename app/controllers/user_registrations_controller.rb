class UserRegistrationsController < Devise::RegistrationsController
  def update
    current_user.newly_registered = false
    current_user.save
    super
  end

  def create
    if verify_recaptcha
      super
    else 
      flash[:alert] = "Please try again. You have entered the wrong ReCaptcha verification words."
      redirect_to new_user_registration_path
    end
  end
end
