class AddScriptPublic < ActiveRecord::Migration
  def self.up
    add_column :scripts, :public, :integer, :default=>0
  end

  def self.down
    remove_column :scripts, :public
  end
end

