Rails.application.routes.draw do
  resources :tweets
  resources :rs_as

  post '/rsas' => 'rs_as#new'
  get '/rsas/:id' => 'rs_as#show'
  post '/rsas/:id/encrypt_messages' => 'tweets#new'
  get '/rsas/:id/encrypt_messages/:msgid' => 'tweets#show'
  post '/rsas/:id/decrypt_messages' => 'tweets#decrypt'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
