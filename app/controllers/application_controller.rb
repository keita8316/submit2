class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
    before_action :authenticate_user!, if: :use_auth?
    
     
    
    def after_sign_in_path_for(resource)
        user_path(resource)
    end
    
    def after_sign_up_path_for(resource)
        user_path(resource)
    end
    
    def after_sign_out_path_for(resource)
        root_path(resource)
    end
    
    

    private
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email, :password])
    end  

    def use_auth?
        unless controller_name == 'homes' && (action_name == 'index' or action_name == 'about')
            true
        end
    end
end
