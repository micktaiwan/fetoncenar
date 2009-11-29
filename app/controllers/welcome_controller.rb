class WelcomeController < ApplicationController
  
  def index
    @scripts = Script.find(:all, :conditions=>"public=1")
  end

end

