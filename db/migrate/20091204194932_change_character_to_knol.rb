class ChangeCharacterToKnol < ActiveRecord::Migration
  def self.up
    rename_table :characters, :knols
  end

  def self.down
    rename_table :knols, :characters
  end
end
