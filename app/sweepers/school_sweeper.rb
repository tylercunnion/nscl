class SchoolSweeper < ActionController::Caching::Sweeper
  observe School
  
  def after_save(school)
    expire_cache_for(school)
  end

  def after_destroy(school)
    expire_cache_for(school)
  end
  
  def expire_cache_for(school)
    expire_page(:controller => '/about', :action => 'join')
  end

  
end