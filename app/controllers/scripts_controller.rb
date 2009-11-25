class ScriptsController < ApplicationController

  def index
    @scripts = []
  end
  
  def my
    @scripts = current_user.scripts
  end
  
  def  new
    @script = Script.new
  end
  
  def create
    @script = Script.new(params[:script])
    @script.save
    @script.add_admin(current_user)
    if @script.errors.empty?
      redirect_back_or_default("/scripts/show/#{@script.id}")
      flash[:notice] = I18n.t(:created_msg)
    else
      render :action => 'new'
    end
  end

  def edit
    # TODO: verify edit rights
    @script = Script.find(params[:id])
  end
  
  def update
    # TODO: verify edit rights
    script = Script.find(params[:id])
    script.update_attributes(params[:script])
    redirect_to :action=>:show, :id=>script.id
  end
  
  def show
    @script = Script.find(params[:id])
  end

end
