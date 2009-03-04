class State < ActiveRecord::Base
    has_many :members
    validates_uniqueness_of :name, :abbreviation
end
