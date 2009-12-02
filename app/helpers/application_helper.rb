# Methods added to this helper will be available to all templates in the application.

module ApplicationHelper

  def get_locale
    session[:locale] || I18n.default_locale
  end

end

class String

  def to_html
    RedCloth.new(h self).to_html
  end
  
end

class Object

  def rrss
    yield self
  end

  def chain(*arr)
    arr.inject(self) do |o,lmb| 
      if block_given? 
        yield o,lmb
      else
        o && o.rrss(&lmb)
      end
    end
  end
  
end

