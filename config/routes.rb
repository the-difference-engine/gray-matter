Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'admins#index', as: :authenticated_root
    end
    
    
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  
#   get '/admins' => 'admins#index'
#   post '/admins' => 'admins#create'
#   get '/admins/:id' => 'admins#show'
#   delete '/admins/:id' => 'admins#destroy'

#   get '/mentors' => 'mentors#index'
#   post '/mentors' => 'mentors#create'
#   get '/mentors/:id' => 'mentors#show'
#   delete '/mentors/:id' => 'mentors#destroy'

#   get '/students' => 'students#index'
#   post '/students' => 'students#create'
#   get '/students/:id' => 'students#show'
#   delete '/students/:id' => 'students#destroy'
end


