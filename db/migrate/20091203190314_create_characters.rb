class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :name
      t.text :descr
      t.integer :script_id
      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
