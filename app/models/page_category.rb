class PageCategory < ActiveRecord::Base
  has_many :pages
  
  validates_uniqueness_of :name
end
