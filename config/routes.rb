Rails.application.routes.draw do
  get 'home/index'

  post 'regi_token' => 'home#regi_token'
  post 'send_message' => 'home#send_message'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
