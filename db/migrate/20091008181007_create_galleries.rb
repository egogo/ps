class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.integer :pos
      t.string  :permalink
      t.string  :ru_title
      t.string  :en_title
      t.text    :ru_description
      t.text    :en_description
    end
  end

  def self.down
    drop_table :galleries
  end
end
