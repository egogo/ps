class CreateContentBlocks < ActiveRecord::Migration
  def self.up
    create_table :content_blocks do |t|
      t.string  :name
      t.text    :ru_content
      t.text    :en_content
    end
  end

  def self.down
    drop_table :content_blocks
  end
end
