Rails.application.routes.draw do
	root to: 'pages#index'
resources :users

get '/login', to: 'users#login'
post '/loginresult', to: 'users#loginresult'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
