class SiteHotel < ApplicationRecord
  validates_uniqueness_of :hotel_id, :scope => [:site_id]  
  belongs_to :site
  belongs_to :hotel
end
  