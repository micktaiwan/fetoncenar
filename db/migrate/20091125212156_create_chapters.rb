class CreateChapters < ActiveRecord::Migration
  def self.up
    create_table  :chapters do |t|
      t.integer   :script_id, :null=>false
      t.integer   :order
      t.string    :title
      t.timestamps
    end
  end

  def self.down
    drop_table :chapters
  end
end
