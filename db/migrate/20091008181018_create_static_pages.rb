class CreateStaticPages < ActiveRecord::Migration
  def self.up
    create_table :static_pages do |t|
      t.integer :pos
      t.string  :permalink
      t.string  :ru_title
      t.string  :en_title
      t.text    :ru_content
      t.text    :en_content
    end
  end

  def self.down
    drop_table :static_pages
  end
end
