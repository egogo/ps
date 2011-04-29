class Admin::PhotosController < Admin::BaseController
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @photo = Photo.new :swf_uploaded_data => params[:Filedata]
    @gallery.photos << @photo
    clear_gallery_cache
    render :partial => 'photo', :locals => { :photo => @photo }
  end
  
  def index
    @gallery = Gallery.find(params[:gallery_id])
    render :partial => 'photo', :collection => @gallery.photo
  end
  
  def set_default
    @gallery = Gallery.find(params[:gallery_id], :include => [:photos])
    current = @gallery.photos.select {|p| p.default? }.first || @gallery.photos.first
    @photo = Photo.find(params[:id])
    @photo.default = true
    @photo.save!
    current.default = false
    current.save
    clear_gallery_cache
    render :update do |page|
      page.replace "image_#{current.id}", :partial => 'photo', :locals => { :photo => current }
      page.replace "image_#{@photo.id}", :partial => 'photo', :locals => { :photo => @photo }
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    clear_gallery_cache
    render :update do |page|
      page.remove "image_#{params[:id]}"
    end
  end
  
  def clear_gallery_cache
    ['en', 'ru'].each {|l| expire_fragment "#{l}_index_photos" }
    ['ru', 'en'].each {|l| expire_fragment "#{l}_gallery_#{@gallery.id}_photos" }
  end
end
