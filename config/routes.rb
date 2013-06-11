# coding: utf-8
SmsVkiem::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :users
  resources :students do
    collection { post :import }
  end
  resources :messages  do 
    get :autocomplete_group_name, :on => :collection
  end
  resources :logs
  resources :pages
  resources :groups
  resources :orders
  resources :desks do
    get :autocomplete_group_name, :on => :collection
  end
  resources :messages
  match '/feedback', :to => "orders#new", as: :feedback
  match '/desk', :to => "desks#desk", as: :user_desk
  get '/dashboard', :to => "admin#dashboard", as: :dashboard
  root :to => 'welcome#index'
  get '/:slug', :to => "pages#show", as: :show_page
  match ':controller(/:action(/:id))(.:format)'
end
