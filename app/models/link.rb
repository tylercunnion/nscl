class Link < ActiveRecord::Base

  def blank?
    if self.id.nil?
      return true
    else
      return false
    end
  end
  
end
