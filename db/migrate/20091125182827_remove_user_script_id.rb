class RemoveUserScriptId < ActiveRecord::Migration

  def self.up
    remove_column :user_scripts, :id
  end

  def self.down
    add_column :user_scripts, :id, :integer, :null=>false
  end
  
end
