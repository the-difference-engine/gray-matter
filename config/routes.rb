Rails.application.routes.draw do
  devise_for :users

  constraints RoleRouteConstraint.new do
    get 'home', to: 'admin_home#show'
  end
  get 'home', to: 'mentor_home#show'
  get 'home', to: 'student_home#show'
end


