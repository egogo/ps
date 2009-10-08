class Gallery < ActiveRecord::Base
  before_save :update_permalink
  has_many  :photos
  has_permalink :permalink, :update => true
  
  protected
    def update_permalink
    self.permalink = self.en_title
    end
end
