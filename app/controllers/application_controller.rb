class ApplicationController < ActionController::Base

  #before_action :authenticate_customer!, except: [:top, :about],if: :use_auth?

  #before_action :authenticate_admin!, except: [:top, :about],if: :use_auth?

  #before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_homes_top_path
    else
      root_path
    end

  end

  private

  def use_auth?
    unless controller_name == 'items' && action_name == 'index'
      true
    end
  end

end
