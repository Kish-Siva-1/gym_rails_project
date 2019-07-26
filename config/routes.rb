Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'logout', to: 'devise/sessions#destroy'
  end 

  resources :users

  resources :users do
    resources :routines
  end

  resources :routines do
    resources :machines
  end

  root 'welcome#home'

end
