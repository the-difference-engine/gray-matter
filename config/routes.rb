Rails.application.routes.draw do
  get 'calendar/show'

  # get 'changepasswords/edit'

  # get 'changepasswords/udpate_password'

  # get 'resources/new'

  # get 'resources/create'

  # get 'resources/edit'

  # get 'resources/update'

  # get 'resources/destroy'

  # get 'resources/index'

  # get 'resources/show'

  # get 'announcements/new'

  # get 'announcements/create'

  # get 'announcements/edit'

  # get 'announcements/update'

  # get 'announcements/destroy'

  # get 'announcements/index'

  # get 'announcements/show'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

# route for changing passwords
  resources :users, only: [:edit]
  get 'changepasswords/edit' => 'changepasswords#edit', as: 'change_password'
  patch 'changepasswords/update_password' => 'changepasswords#update_password', as: 'update_password'

  post '/members' => 'members#add_member', as: 'add_a_member'

  get '/profiles/:id' => 'profiles#show', as: 'profile'
  post '/profiles' => 'profiels#create'
  get '/groups/:name' => 'groups#show', as: 'group'

#   get '/admin' => 'admins#index'
#   post '/admins' => 'admins#create'
#   get '/admins/:id' => 'admins#show'
#   delete '/admins/:id' => 'admins#destroy'

  # get '/mentor' => 'mentors#index'
  # post '/mentors' => 'mentors#create', as: 'add_mentor'
  # get '/mentors/:id' => 'mentors#show'
  # delete '/mentors/:id' => 'mentors#destroy'
  # get 'mentors' => 'mentors#new', as: 'mentors'

  resources :admins
  resources :mentors
  resources :students

  resources :announcements
  resources :resources

  resource :calendar, only: [:show], controller: :calendar

  # get '/students' => 'students#index'
  # post '/students' => 'students#create'
  # get '/students/:id' => 'students#show'
  # delete '/students/:id' => 'students#destroy'
end


