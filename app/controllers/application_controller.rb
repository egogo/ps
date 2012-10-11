# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # AuthenticatedSystem must be included for RoleRequirement, and is provided by installing acts_as_authenticates and running 'script/generate authenticated account user'.
  include AuthenticatedSystem
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  include RoleRequirementSystem


  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  DEFAULT_LANGUAGE = 'ru'
  
  before_filter :set_lang, :get_items, :load_statics,  :set_keywords_and_desc
  
  protected
    def set_lang
      session[:lang] ||= DEFAULT_LANGUAGE
      session[:lang] = params[:lang] if !params[:lang].nil? && !params[:lang].blank? && ['ru', 'en'].include?(params[:lang]) 
    end
    
    def get_items
      @static_pages_list = StaticPage.find(:all, :order => 'pos ASC')
      @galleries_list = Gallery.find(:all, :order => 'pos ASC')
    end
    
    def load_statics
      @copyright = ContentBlock.find_by_name('copyright')
    end
    
    def default_url_options(options={})
      { :lang => session[:lang] }.reverse_merge!(options)
    end
    
    def set_keywords_and_desc
      @keywords = 'photo, фото, photographer, фотограф, studio, студия'
      @description = 'Фотостудия ШАФТ'
    end
  
end
