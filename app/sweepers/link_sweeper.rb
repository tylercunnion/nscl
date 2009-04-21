class LinkSweeper < ActionController::Caching::Sweeper
  observe Link
  
  def after_save(link)
    expire_cache_for(link)
  end

  def after_destroy(link)
    expire_cache_for(link)
  end
  
  def expire_cache_for(link)
    expire_page(:controller => '/about', :action => 'states')
  end
  
end