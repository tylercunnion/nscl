class EventsController < ApplicationController
  
  def index
    redirect_to :action => 'convention'
  end
  
  def convention
    @page_title = "National Convention"
  end
  
  def scl_events
    @page_title = "SCL Events"
  end
  
  
  
  def chairs
    @page_title = "Event Chairs"
    @chairs = ["Ludi Chess", "Ludi Soccer", "Ludi Basketball", "Ludi Volleyball", "That's Entertainment", "Olympika Swimming", "Olympika Track Events", "Olympika Field Events", "Marathon", "Banquet"]
  end
  
  def chair_signup
    
  end
end
