class RegistrationsController < Devise::RegistrationsController
  respond_to :js

  def new
    super
  end

  def create
    super
  #   self.resource = warden.authenticate(auth_options)
  #   if resource
  #     sign_in(resource_name, resource)
  #     flash[:notice] = 'Signed in successfully.'
  #     redirect_to root_path
  #   else
  #     render json: { message: 'Could not log you in' }, status: :unauthorized
  #   end
   end
end