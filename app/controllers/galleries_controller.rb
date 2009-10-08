class GalleriesController < ApplicationController
  
  def index; end
  
  def show
    @gallery = @galleries_list.select {|g| g.permalink == params[:permalink]}.first
    @gallery.photos(true)
  end
  
end
