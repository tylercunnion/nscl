class OfficerSweeper < ActionController::Caching::Sweeper
  observe Officer
  
  def after_save(officer)
    expire_cache_for(officer)
  end

  def after_destroy(officer)
    expire_cache_for(officer)
  end
  
  def expire_cache_for(officer)
    expire_page(:controller => 'business/officers', :action => 'index', :link => officer.link)
  end
  
  def expire_all_officers()
    officers = officers
    officers.each do |o|
      expire_cache_for(o)
    end
  end
  
end