class CharactersController < ApplicationController

  def index
    @script = Script.find(session[:script_id])
    @chars   = Character.find(:all, :conditions=>["script_id=?",session[:script_id]])
  end
  
  def new
    @script = Script.find(session[:script_id])
    @char   = Character.new
  end
  
  def create
    @char = Character.new(params[:char])
    @char.script_id = session[:script_id]
    @char.save
    if @char.errors.empty?
      redirect_back_or_default("/characters/show/#{@char.id}")
      flash[:notice] = I18n.t(:created_msg)
    else
      render :action => 'new'
    end
  end

  def edit
    @script = Script.find(session[:script_id])
    check_role(@script, "cowriters")
    @char = Character.find(params[:id])
  end
  
  def update
    @script = Script.find(session[:script_id])
    check_role(@script, "cowriters")
    char = Character.find(params[:id])
    char.update_attributes(params[:char])
    redirect_to :action=>:show, :id=>char.id
  end
  
  def show
    @script = Script.find(session[:script_id])
    check_role(@script, "cowriters")
    @char = Character.find(params[:id])
  end
 
end

