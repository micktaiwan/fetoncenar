class CreateParagraphs < ActiveRecord::Migration
  def self.up
    create_table :paragraphs do |t|
      t.integer   :chapter_id
      t.text      :text
      t.integer   :order
      t.timestamps
    end
  end

  def self.down
    drop_table :paragraphs
  end
end
