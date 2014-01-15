GkoWelcomeCarRentalStBarthCom::Application.routes.draw do
  get 'car_lists/:car_list_id', 
    :to => 'cars#index'

  match 'car_lists/:car_list_id/:permalink', 
    :to => "cars#show"
  
  resources :reservations, :format => :js
    
  namespace :admin do
    resources :sites do
      resources :car_lists do
        resources :cars
      end
    end
  end
end
