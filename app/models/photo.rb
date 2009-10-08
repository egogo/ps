class Photo < ActiveRecord::Base
  belongs_to  :gallery
  has_attached_file :image, :styles => { :thumb => "48x48" }
end
