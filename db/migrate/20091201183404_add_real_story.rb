class AddRealStory < ActiveRecord::Migration
  def self.up
    add_column :scripts, :real_story, :text
  end

  def self.down
    remove_column :scripts, :real_story
  end
end
