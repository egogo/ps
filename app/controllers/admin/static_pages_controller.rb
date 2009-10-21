class Admin::StaticPagesController < Admin::BaseController
  before_filter :get_pages
  
  def index
    redirect_to edit_admin_static_page_path(@pages.first)
  end
  
  def edit
    @page = @pages.select {|p| p.id.to_s == params[:id]}.first
  end
  
  def update
    @page = @pages.select {|p| p.id.to_s == params[:id]}.first
    if @page.update_attributes params[:page]
      flash[:notice] = 'Страница сохраненна'
      expire_page :controller => "/static_pages", :action => "show", :permalink => @page.permalink, :lang => 'en'
      expire_page :controller => "/static_pages", :action => "show", :permalink => @page.permalink, :lang => 'ru'
      redirect_to edit_admin_static_page_path(@page)
    else
      flash[:error] = 'Страница не сохраненна сохраненна'
      render :action => 'edit'
    end
  end
  
  protected
    def get_pages
      @pages = StaticPage.find :all
    end
end
