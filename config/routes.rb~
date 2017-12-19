Rails.application.routes.draw do
  resources :rsas
  resources :tweets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	post '/rsa', to: 'rs_as#create'
	get '/rsa/:id', to: 'rs_as#show'

	post '/rsa/:id/encrypt_messages', to: 'tweets#create'
	get '/rsa/:id/encrypt_messages/:mid', to: 'tweets#show'
	post '/rsa/:id/decrypt_messages', to: 'tweets#decrypt'
end
