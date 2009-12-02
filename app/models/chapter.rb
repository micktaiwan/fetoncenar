class Chapter < ActiveRecord::Base

  belongs_to  :script
  has_many    :paragraphs
  
  after_save :set_script_update_date
  
  def set_script_update_date
    self.script.updated_at = self.updated_at
    self.script.save
  end

end

