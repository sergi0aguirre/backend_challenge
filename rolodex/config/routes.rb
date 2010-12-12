Rolodex::Application.routes.draw do
  devise_for :users
  root :to => 'rolodex#index'
  match  'search' => "contacts#search"
  resources :contacts do
      post :delete_selection , :on => :collection
  end

end



