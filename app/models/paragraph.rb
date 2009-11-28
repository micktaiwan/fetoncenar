class Paragraph < ActiveRecord::Base

  belongs_to :chapter
  after_save :set_chapter_update_date
  
  def set_chapter_update_date
    self.chapter.updated_at = self.updated_at
    self.chapter.save
  end

end
