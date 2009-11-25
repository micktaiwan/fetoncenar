class UserScript < ActiveRecord::Base

  belongs_to :user
  belongs_to :script
  belongs_to :editor, :class_name=>'User', :foreign_key=>:user_id

end
