class EventsController < ApplicationController
  
  def convention
    @page_title = "National Convention"
  end
  
  def scl_events
    @page_title = "SCL Events"
  end
  
  
  
  def chairs
    @page_title = "Event Chairs"
    @chairs = ["Ultimate Frisbee", "Ludi Chess", "Ludi Soccer", "Ludi Kickball", "Ludi Volleyball", "That's Entertainment", "Olympika Swimming", "Olympika Track Events", "Olympika Field Events", "Marathon", "Banquet"]
  end
  
  def chairs_signup
    spam = SpamFilter.new
    if spam.is_legit?(params)
      Mail.deliver_event_chair(params)
      @spam = false
    else
      @spam = true
    end
  end
  
  enable_sitemap :except => ["chairs_signup"]
end
