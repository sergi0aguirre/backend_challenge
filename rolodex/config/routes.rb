Rolodex::Application.routes.draw do
  devise_for :users
  root :to => 'rolodex#index'
end
