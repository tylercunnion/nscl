class PagesController < ApplicationController
  
  require 'RedCloth'
  def index
    error = 0
    args = params[:path]
    logger.debug "Attempting to render CMS page"
    logger.debug "Args: " + args.inspect
    unless args.blank? or args.length > 2
      category_name = args[0]
      @category = PageCategory.find(:first, :conditions => {:name => category_name}, :include => :pages)
    end
    
    if @category.blank?
      logger.debug "FAIL: No category"
      error += 1
    end
    
    logger.debug "Category Retrieved"
    
    @pages = @category.pages unless @category.blank?
    
    if args[1]
      page_name = args[1]
    else
      page_name = "index"
    end
    
    @page = @pages.find(:first, :conditions => {:address => }) unless @pages.blank?
    
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
