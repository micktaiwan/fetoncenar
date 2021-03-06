class KnolsController < ApplicationController

  def index
    @script = Script.find(session[:script_id])
    @knols   = Knol.find(:all, :conditions=>["script_id=?",session[:script_id]])
  end
  
  def new
    @script = Script.find(session[:script_id])
    @knol   = Knol.new
  end
  
  def create
    @knol = Knol.new(params[:knol])
    @knol.script_id = session[:script_id]
    @knol.save
    if @knol.errors.empty?
      redirect_back_or_default("/knols/show/#{@knol.id}")
      flash[:notice] = I18n.t(:created_msg)
    else
      render :action => 'new'
    end
  end

  def edit
    @script = Script.find(session[:script_id])
    check_role(@script, "cowriters")
    @knol = Knol.find(params[:id])
  end
  
  def update
    @script = Script.find(session[:script_id])
    check_role(@script, "cowriters")
    knol = Knol.find(params[:id])
    knol.update_attributes(params[:knol])
    redirect_to :action=>:show, :id=>knol.id
  end
  
  def show
    @script = Script.find(session[:script_id])
    check_role(@script, "cowriters")
    @knol = Knol.find(params[:id])
  end
 
end

