class AddKeywords < ActiveRecord::Migration
  def self.up
    add_column :galleries, :keywords, :string, :default => nil
    add_column :galleries, :description, :string, :default => nil
  end

  def self.down
    remove_column :galleries, :keywords, :string, :default => nil
    remove_column :galleries, :description, :string, :default => nil
  end
end
