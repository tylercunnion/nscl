class PagesController < ApplicationController
  
  require 'RedCloth'
  def index
    error = 0
    
    if params[:category]
      category_name = params[:category]
      page_name = params[:page]
    else
      args = params[:path]
      category_name = args[0]
      page_name = args[1] if args[1]
    end     
      
    page_name ||= "index"
    
    
    logger.debug "Attempting to render CMS page"

    @category = PageCategory.find(:first, :conditions => {:name => category_name}, :include => :pages)
    
    if @category.blank?
      logger.debug "FAIL: No category"
      error += 1
    end
    
    logger.debug "Category Retrieved"
    
    @pages = @category.pages unless @category.blank?
    
    @page = @pages.find(:first, :conditions => {:address => page_name}) unless @pages.blank?
    
    unless @page.blank?
      @page_body = RedCloth.new(@page.body)
    else
      error += 1
    end
    
    if error == 0
      render 'pages/index'
    else
      render 'error/index', :status => 404
    end
  end
  
  
end
