Rails.application.routes.draw do
  resources :bookings
  resources :site_hotels
  resources :hotels
  resources :sites
  
  resources :sites do  
    resources :site_hotels do  
      resources :bookings  
    end  
 end
 
end
