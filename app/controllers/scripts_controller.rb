class ScriptsController < ApplicationController

  def index
    @scripts = Script.find(:all, :conditions=>"public=1", :order=>"updated_at desc")
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
    @script = Script.find(params[:id])
    check_role(@script, "cowriters")
  end
  
  def update
    script = Script.find(params[:id])
    check_role(script, "cowriters")
    script.update_attributes(params[:script])
    redirect_to :action=>:show, :id=>script.id
  end
  
  def show
    script_id = params[:id]
    @script   = Script.find(script_id)
    check_show_rights(@script, "reviewers")
    @chapters = Chapter.find(:all, :conditions=>["script_id=?", script_id], :order=>"`order`")
  end
  
  def new_chapter
    @script_id = params[:id]
    script = Script.find(@script_id)
    check_role(script, "cowriters")
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

  def edit_chapter
    @chapter = Chapter.find(params[:id])
    check_role(@chapter.script, "cowriters")
    render(:partial=>'edit_chapter')
  end

  def edit_chapter_descr
    @chapter = Chapter.find(params[:id])
    check_role(@chapter.script, "cowriters")
    render(:partial=>'edit_chapter_descr')
  end

  
  def update_chapter
    @chapter = Chapter.find(params[:id])
    check_role(@chapter.script, "cowriters")
    @chapter.update_attributes(params[:chapter])
    render(:partial=>'chapter_title', :locals=>{:chapter=>@chapter})
  end

  def update_chapter_descr
    @chapter = Chapter.find(params[:id])
    check_role(@chapter.script, "cowriters")
    @chapter.update_attributes(params[:chapter])
    render(:partial=>'chapter_descr', :locals=>{:chapter=>@chapter})
  end

  
  def new_para
    @chapter_id = params[:id]
    @para = Paragraph.new
    render(:partial=>'new_para')
  end

  def create_para
    @paragraph = Paragraph.new(params[:para])
    chapter = Chapter.find(params[:para][:chapter_id])
    @paragraph.order = chapter.paragraphs.size
    @paragraph.save
    if @paragraph.errors.empty?
      render(:partial=>'paragraph')
    else
      render(:text=>"alert('error');")
    end
  end

  def edit_para
    @para = Paragraph.find(params[:id])
    check_role(@para.chapter.script, "cowriters")
    render(:partial=>'edit_para')
  end

  def update_para
    @paragraph = Paragraph .find(params[:id])
    check_role(@paragraph.chapter.script, "cowriters")
    @paragraph.update_attributes(params[:para])
    @str = render_to_string(:partial=>'paragraph')
  end

  def destroy_para
    Paragraph.find(params[:id]).destroy
    render(:nothing=>true)
  end

end

