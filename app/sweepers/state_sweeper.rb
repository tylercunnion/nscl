class StateSweeper < ActionController::Caching::Sweeper
  observe State
  
  def after_save(state)
    expire_cache_for(state)
  end

  def after_destroy(state)
    expire_cache_for(state)
  end
  
  def expire_cache_for(state)
    expire_page(:controller => '/about', :action => 'join')
  end

  
end