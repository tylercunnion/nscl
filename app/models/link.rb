class Link < ActiveRecord::Base

  def blank?
    if self.id.nil?
      return true
    else
      return false
    end
  end
  
  validates_presence_of :url
  validates_uniqueness_of :url
  validates_presence_of :name
  
end
