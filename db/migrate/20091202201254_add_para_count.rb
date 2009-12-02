class AddParaCount < ActiveRecord::Migration
  def self.up
    add_column :scripts, :paragraphs_count, :integer, :default=>0
  end

  def self.down
    remove_column :scripts, :paragraphs_count
  end
end

