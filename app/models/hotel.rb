class Hotel < ApplicationRecord
  validates :name, presence: true, uniqueness: true  
  has_many :sites, :through => :site_hotels
  has_many :site_hotels, :dependent => :destroy    
end
  