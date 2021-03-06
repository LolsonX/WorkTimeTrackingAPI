Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, param: :id, except: [:show]
  get '/user', to: 'users#show_by_token'
  post '/auth/login', to: 'authentication#login'
  resources :customer
  resources :project
  resources :modulu
  resources :task
  resources :role
  resources :work_item, except: [:show]
  get '/work_hours', to: 'work_item#show_hours'
  resources :state, only:[:index]
  get '/*a', to: 'application#not_found'
end
