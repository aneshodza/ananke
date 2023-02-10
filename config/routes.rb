# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects
  resources :tasks
  resources :comments

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               sign_up: 'signup'
             },
             controllers: {
               registrations: 'registrations',
               sessions: 'sessions'
             }

  root 'home#index'

  get 'users', to: 'users#index'
  get 'my-tasks', to: 'users#my_tasks', as: 'my_tasks'
end
