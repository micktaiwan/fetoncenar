class Script < ActiveRecord::Base

  include ApplicationHelper

  has_many :user_scripts
  has_many :contributors, :through=>:user_scripts
  has_many :authors,      :through=>:user_scripts, :conditions=>"rights<=#{Role::Author}"
  has_many :cowriters,    :through=>:user_scripts, :conditions=>"rights<=#{Role::CoWriter}"
  has_many :reviewers,    :through=>:user_scripts, :conditions=>"rights<=#{Role::Reviewer}"
  has_many :chapters

  def add_admin(user)
    UserScript.create(:user_id=>user.id, :script_id=>self.id, :rights=>1)
  end  
  
  def contributors_names
    self.contributors.collect { |c| c.name} * ", "
  end
  
end

