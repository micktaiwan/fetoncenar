class Chapter < ActiveRecord::Base

  belongs_to  :script
  has_many    :paragraphs

end
