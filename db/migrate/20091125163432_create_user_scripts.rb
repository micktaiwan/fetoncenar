class CreateUserScripts < ActiveRecord::Migration
  def self.up
    create_table :user_scripts do |t|
      t.integer :user_id,   :null=>false
      t.integer :script_id, :null=>false
      t.integer :rights,    :default=>0
      t.timestamps
    end
  end

  def self.down
    drop_table :user_scripts
  end
end
