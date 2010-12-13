Rolodex::Application.routes.draw do
  devise_for :users
  root :to => 'rolodex#index'
  match  'search' => "contacts#search"
  resources :phone_numbers
  resources :addresses
  resources :contacts do
    post :delete_selection , :on => :collection
    get :export_to_vcard, :on => :member
    get :export_to_vcards, :on => :collection
  end
  resources :lists do
    get :show_contacts , :on => :member
    get :add_contact, :on => :member
    get :export_to_vcards, :on => :member
    post :delete_selection, :on => :collection
  end
end



