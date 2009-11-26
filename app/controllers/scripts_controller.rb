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
    script_id = params[:id]
    @script   = Script.find(script_id)
    @chapters = Chapter.find(:all, :conditions=>["script_id=?", script_id], :order=>"`order`")
  end
  
  def new_chapter
    @script_id = params[:id]
    @chapter = Chapter.new
    render(:partial=>'new_chapter')
  end

  def create_chapter
    @chapter = Chapter.new(params[:chapter])
    script = Script.find(params[:chapter][:script_id])
    @chapter.order = script.chapters.size
    @chapter.save
    if @chapter.errors.empty?
      render(:partial=>'chapter')
    else
      render(:text=>"alert('error');")
    end
  end

  def new_para
    @chapter_id = params[:id]
    @para = Paragraph.new
    render(:partial=>'new_para')
  end

end

