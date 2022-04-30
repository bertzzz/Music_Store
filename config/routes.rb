# frozen_string_literal: true

Rails.application.routes.draw do
  get 'contact/index'
  get 'aboutpage/show'
  resources :carts
  resources :aboutpage
  resources :contact
  resources :order
  
  resources :charges, only:[:new, :create]

  resources :line_items do
    match :qty, action: :qty, via: %i[post delete], on: :member
  end

  resources :instruments do
    collection do
      get 'search_results'
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'instruments#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
