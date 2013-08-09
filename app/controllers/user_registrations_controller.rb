class UserRegistrationsController < Devise::RegistrationsController
  def update
    current_user.newly_registered = false
    current_user.save
    super
  end
end
