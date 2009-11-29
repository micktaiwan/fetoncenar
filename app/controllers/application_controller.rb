# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

include ApplicationHelper

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout 'general'
  before_filter :set_locale
  include AuthenticatedSystem
  
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  
  
private
  
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
  
end
