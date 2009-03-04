class Officer < ActiveRecord::Base
  belongs_to :member
  
  def blank?
    if self.id.nil?
      return true
    else
      return false
    end
  end
  
  validates_uniqueness_of :name, :link

end
