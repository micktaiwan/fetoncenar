class DevelopmentController < ApplicationController

  def index
    session[:current_script_id] = params[:id]
  end

end

