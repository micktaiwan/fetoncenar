# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  class Role

    Author    = 1 # can do anything
    CoWriter  = 2 # can not manage writers
    Reviewer  = 4 # can not edit text, just view it and do comments
    
  end


  def get_locale
    session[:locale] || I18n.default_locale
  end

end
