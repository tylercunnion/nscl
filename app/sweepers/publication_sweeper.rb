class PublicationSweeper < ActionController::Caching::Sweeper
  observe Publication
  
  def after_save(pub)
    expire_cache_for(pub)
  end

  def after_destroy(pub)
    expire_cache_for(pub)
  end
  
  def expire_cache_for(pub)
    action = case pub.pub_type
      when "Convention Ear" then "convention_ear"
      when "Letter of the League" then "letter"
    end
    
    expire_fragment(Regexp.new("publications/" + action))
  end

  
end