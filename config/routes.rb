Rails.application.routes.draw do
  devise_for :users
  get '/admins' => 'admins#index'
  post '/admins' => 'admins#create'
  get '/admins/:id' => 'admins#show'
  delete '/admins/:id' => 'admins#destroy'

  get '/mentors' => 'mentors#index'
  post '/mentors' => 'mentors#create'
  get '/mentors/:id' => 'mentors#show'
  delete '/mentors/:id' => 'mentors#destroy'

  get '/students' => 'students#index'
  post '/students' => 'students#create'
  get '/students/:id' => 'students#show'
  delete '/students/:id' => 'students#destroy'

end


