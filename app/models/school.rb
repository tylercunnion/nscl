class School < ActiveRecord::Base
  has_many :members
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def blank?
    if self.id.nil?
      return true
    else
      return false
    end
  end
  
end
