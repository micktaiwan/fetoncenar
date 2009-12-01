class DevelopmentController < ApplicationController

  def index
    session[:current_script_id] = params[:id]
    @script  = Script.find(session[:current_script_id])
    check_role(@script, "cowriters")
  end

  
  def update_real_story
    script = Script.find(params[:id])
    check_role(script, "cowriters")
    script.update_attributes(params[:script])
    render(:nothing=>true)
  end

end

