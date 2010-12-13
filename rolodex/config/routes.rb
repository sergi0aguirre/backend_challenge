Rolodex::Application.routes.draw do
  devise_for :users
  root :to => 'rolodex#index'
  match  'search' => "contacts#search"
  resources :phone_numbers
  resources :addresses
  resources :contacts do
    post :delete_selection , :on => :collection
  end
end



