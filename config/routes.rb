# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'users#show'
  resources :user_languages, only: %i[new create]

  resources :user_words, only: %i[update]
  resources :courses, only: %i[index new create show] do
    resources :chapters, only: %i[new create show]
  end

  resources :words, param: :slug, only: %i[show]
end
