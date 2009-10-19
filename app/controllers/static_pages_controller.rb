class StaticPagesController < ApplicationController
  caches_page :show
  
  def show
    @page = @static_pages_list.select {|p| p.permalink == params[:permalink]}.first
  end
end
