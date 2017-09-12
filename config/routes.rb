# frozen_string_literal: true
 Rails.application.routes.draw do
  resources :friendships, except: [:new, :edit]
  resources :comments, except: [:new, :edit]
  resources :statuses, except: [:new, :edit]
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  patch '/update-info/:id' => 'users#update'
  # get '/users' => 'users#index'
  resources :users, only: [:index, :show]
end
