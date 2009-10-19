class Admin::BaseController < ApplicationController
  MENU_ITEMS = [ ['Галлереи', 'galleries'], ['Статические страницы', 'static_pages'], ['Пользователи', 'users'], ['Контентные блоки', 'content_blocks'] ]
  require_role 'admin'
  layout 'admin'
  
  protected
    def default_url_options(options=nil); end
    
    def set_lang; end
    
    def get_items; end
    
end
