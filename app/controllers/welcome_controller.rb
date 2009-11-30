class WelcomeController < ApplicationController
  
  def index
    @scripts = Script.find(:all, :conditions=>"public=1", :order=>"updated_at desc")
  end

  def no_permission
  end
  
end

