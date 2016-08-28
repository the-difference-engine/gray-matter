Rails.application.routes.draw do
  get 'groups/show'

  devise_for :users


  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end
    
    
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end


  get '/profiles/:id' => 'profiles#show', as: 'profile'
  post '/profiles' => 'profiels#create'

  get '/admin' => 'admins#index'
#   post '/admins' => 'admins#create'
  get '/admins/:id' => 'admins#show'
  delete '/admins/:id' => 'admins#destroy'

  get '/mentor' => 'mentors#index'
  post '/mentors' => 'mentors#create'
  get '/mentors/:id' => 'mentors#show'
  delete '/mentors/:id' => 'mentors#destroy'

  get '/student' => 'students#index'
  post '/students' => 'students#create'
  get '/students/:id' => 'students#show'
  delete '/students/:id' => 'students#destroy'
end


