# frozen_string_literal: true

Rails.application.routes.draw do
  get    '/login_form' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :account_activations, only: [:edit]

  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'

  post 'posts/:post_id/comments' => 'comments#create'
  delete 'posts/:post_id/comments/:comment_id' => 'comments#destroy'

  patch 'users/:id/update' => 'users#update', as: 'users_update'
  get 'users/:id/edit' => 'users#edit'
  post 'users/create' => 'users#create'
  get 'signup' => 'users#new'
  get '/users/search' => 'users#search'
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show', as: 'users_show'
  get 'users/:id/likes' => 'users#likes'
  get 'users/:id/comments' => 'users#comments'
  delete '/users/:id/destroy' => 'users#destroy'
  get '/admin' => 'users#admin'
  get '/password_reset_form' => 'users#password_reset_form'
  
  get '/posts/index' => 'posts#index'
  get '/posts/search' => 'posts#search'
  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create', as: 'posts_create'
  get '/posts/:id' => 'posts#show', as: 'posts_show'
  get '/posts/:id/edit' => 'posts#edit'
  patch '/posts/:id/update' => 'posts#update', as: 'posts_update'
  delete '/posts/:id/destroy' => 'posts#destroy'
 
  get '/ranking' => 'ranking#ranking'
  get '/' => 'home#top'
  get 'about' => 'home#about'
end