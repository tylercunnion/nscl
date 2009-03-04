class Member < ActiveRecord::Base
  has_one :officer
  belongs_to :school
  belongs_to :state
  belongs_to :home_state,
    :class_name => "State",
    :foreign_key => "home_state_id"
  belongs_to :school_state,
    :class_name => "State",
    :foreign_key => "school_state_id"
    
  def name
    first + " " + last
  end
  
  def blank?
    if self.id.nil?
      return true
    else
      return false
    end
  end
  
  validates_presence_of :first, :last, :email, :grad_year, :school_id, :state_id
end
