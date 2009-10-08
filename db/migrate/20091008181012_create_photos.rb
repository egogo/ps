class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.belongs_to  :gallery
      t.string      :ru_caption
      t.string      :en_caption
      t.text        :ru_description
      t.text        :en_description
    end
  end

  def self.down
    drop_table :photos
  end
end
