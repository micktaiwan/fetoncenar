class UserScript < ActiveRecord::Base

  belongs_to :user
  belongs_to :script
  belongs_to :contributor, :class_name=>'User', :foreign_key=>:user_id
  belongs_to :author,   :class_name=>'User', :foreign_key=>:user_id
  belongs_to :cowriter, :class_name=>'User', :foreign_key=>:user_id
  belongs_to :reviewer, :class_name=>'User', :foreign_key=>:user_id

end

