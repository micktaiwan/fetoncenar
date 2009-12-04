class AddChapterDescr < ActiveRecord::Migration
  def self.up
    add_column :chapters, :descr, :text
  end

  def self.down
    remove_column :chapters, :descr
  end
end
