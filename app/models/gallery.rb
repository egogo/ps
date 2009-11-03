class Gallery < ActiveRecord::Base
  before_save :update_permalink
  has_many  :photos, :order => "position"
  has_permalink :permalink, :update => true
  
  validates_presence_of :ru_title, :message => "^Русское название обязательно к заполнению"
  validates_presence_of :en_title, :message => "^Английское название обязательно к заполнению"
  
  def default_photo
    self.photos.find(:first, :conditions => {:default => true}) || self.photos.first
  end
  
  protected
    def update_permalink
    self.permalink = self.en_title
    end
end
