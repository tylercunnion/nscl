class PageCategory < ActiveRecord::Base
  has_many :pages, :foreign_key => "category_id"
  
  validates_uniqueness_of :name
end
