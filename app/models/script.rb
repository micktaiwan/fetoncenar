class Script < ActiveRecord::Base

  has_many :user_scripts
  has_many :contributors, :through=>:user_scripts
  has_many :editors, :through=>:user_scripts, :conditions=>"rights=1"

  def add_admin(user)
    UserScript.create(:user_id=>user.id, :script_id=>self.id, :rights=>1)
  end  

end

