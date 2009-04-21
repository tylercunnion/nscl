class PageSweeper < ActionController::Caching::Sweeper
  observe Page
  
  def after_save(page)
    expire_category(page.category)
  end

  def after_destroy(page)
    expire_category(page.category)
  end
  
  def expire_cache_for(page)
    unless page.address == "index"
      expire_page(:controller => '/pages', :action => 'index', :category => page.category.name, :page => page.address)
    else
      expire_page("/#{page.category.name}")
    end
  end
  
  def expire_category(category)
    pages = category.pages
    pages.each do |p|
      expire_cache_for(p)
    end
  end
  
end