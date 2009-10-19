class Admin::GalleriesController < Admin::BaseController
  before_filter :get_galleries
  
  def index
    redirect_to admin_gallery_path(@galleries_list.first)
  end
  
  def show
    @gallery = @galleries_list.select {|g| g.id.to_s == params[:id]}.first
    @gallery.photos(true)
  end
  
  def new
    @gallery = Gallery.new
  end
  
  def create
    @gallery = Gallery.new params[:gallery]
    if @gallery.save
      redirect_to edit_admin_galleries_path(@gallery)
    else
      render :action => 'new'
    end 
  end
  
  def update
    @gallery = Gallery.find params[:id]
    if @gallery.update_attributes params[:gallery]
      redirect_to admin_gallery_path(@gallery)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @gallery = Gallery.find params[:id]
    @gallery.destroy
    redirect_to admin_galleries_path
  end
  
  protected
    def get_galleries
      @galleries_list = Gallery.find(:all, :order => 'pos ASC')
    end
end
