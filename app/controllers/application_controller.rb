# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout 'general'
  before_filter :set_locale
  include AuthenticatedSystem
  
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  
  
private
  
  include ApplicationHelper
  
  def set_locale
    locale = I18n.locale = get_locale
    p = params[:locale]
    return if not p
    if p == ''
      locale = (locale=='en'? 'fr':'en')
    else
      locale = p
    end
    session[:locale] = I18n.locale = locale
    
    #OPTIMIZE better locales handling
    #locale = params[:locale] || session[:locale] || (this_user.site_language if is_logged_in?) || I18n.default_locale
    #locale = AVAILABLE_LOCALES.keys.include?(locale) ? locale : I18n.default_locale
    #session[:locale] = I18n.locale = locale
  end
  
  def check_role(script, role, user=current_user)
    redirect_to "/welcome/no_permission" if not eval("script.#{role}").include?(user)
  end

  def check_show_rights(script, role, user=current_user)
    redirect_to "/welcome/no_permission" if @script.public==0  and not eval("script.#{role}").include?(user)
  end

  def check_public
    redirect_to "/welcome/no_permission" if @script.public==0  
    return true
  end
  
  
end
