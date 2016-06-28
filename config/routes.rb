Rails.application.routes.draw do
  devise_for :users

root 'pages#home'
get '/admins' => 'admins#index'  

end


