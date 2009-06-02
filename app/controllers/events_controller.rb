class EventsController < ApplicationController
  
  def convention
    @page_title = "National Convention"
  end
  
  def scl_events
    @page_title = "SCL Events"
  end
  
  
  
  def chairs
    @page_title = "Event Chairs"
    @chairs = ["Ludi Chess", "Ludi Soccer", "Ludi Kickball", "Ludi Volleyball", "That's Entertainment", "Olympika Swimming", "Olympika Track Events", "Olympika Field Events", "Marathon", "Banquet"]
  end
  
  def chairs_signup
    Mail.deliver_event_chair(params)
  end
  
  enable_sitemap :except => ["chairs_signup"]
end
