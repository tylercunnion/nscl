class EventsController < ApplicationController
  
  def index
    redirect_to :action => 'convention'
  end
  
  def chairs
    @chairs = ["Ludi Chess", "Ludi Soccer", "Ludi Basketball", "Ludi Volleyball", "That's Entertainment", "Olympika Swimming", "Olympika Track Events", "Olympika Field Events", "Marathon", "Banquet"]
  end
  
  def chair_signup
    
  end
end
