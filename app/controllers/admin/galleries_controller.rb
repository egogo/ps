class Admin::GalleriesController < Admin::BaseController
  before_filter :get_galleries
  
  def index
    redirect_to admin_gallery_path(@galleries_list.first)
  end
  
  def show
    @gallery = @galleries_list.select {|g| g.id.to_s == params[:id]}.first
    @gallery.photos(true)
  end
  
  def sort
    @gallery = @galleries_list.select {|g| g.id.to_s == params[:id]}.first
    @gallery.photos(true)
    @gallery.photos.each do |f|
      f.position = params["photo-list"].index(f.id.to_s)+1
      f.save
    end
    render :update do |page|
      
    end
  end
  
  def new
    @gallery = Gallery.new
  end
  
  def create
    @gallery = Gallery.new params[:gallery]
    if @gallery.save
      clear_gallery_cache
      redirect_to edit_admin_galleries_path(@gallery)
    else
      render :action => 'new'
    end 
  end
  
  def update
    @gallery = Gallery.find params[:id]
    if @gallery.update_attributes params[:gallery]
      clear_gallery_cache
      redirect_to admin_gallery_path(@gallery)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @gallery = Gallery.find params[:id]
    @gallery.destroy
    clear_gallery_cache
    redirect_to admin_galleries_path
  end
  
  protected
    def get_galleries
      @galleries_list = Gallery.find(:all, :order => 'pos ASC')
    end
    
    def clear_gallery_cache
      ['en', 'ru'].each {|l| expire_fragment "#{l}_index_photos" }
      ['ru', 'en'].each {|l| expire_fragment "#{l}_gallery_#{@gallery.id}_photos" }
    end
end
