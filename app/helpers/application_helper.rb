# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def get_locale
    session[:locale] || I18n.default_locale
  end

end
