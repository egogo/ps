require 'mime/types'
class Photo < ActiveRecord::Base
  belongs_to  :gallery
  has_attached_file :image, :styles => { :gal => ["700x466>", :png], :thumb => ["48x48#", :png], :admin_thumb => ["70x47>", :png], :admin_prev => ["140x94>", :png] },
                    :convert_options => { :all=> "-quality 80" },
                    :url  => "/images/gallery/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/gallery/:id/:style/:basename.:extension"

  def swf_uploaded_data=(data)
    data.content_type = MIME::Types.type_for(data.original_filename)
    self.image = data
  end
end
