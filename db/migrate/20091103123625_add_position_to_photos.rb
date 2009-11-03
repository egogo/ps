class AddPositionToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :position, :integer, :default => 0
  end

  def self.down
    remove_column :photos, :position, :integer, :default => 0
  end
end
