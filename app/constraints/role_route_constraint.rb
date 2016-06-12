class RoleRouteConstraint
  def matches?(request)
    user = current_user(request)
    user.present? && user.has_role?(:admin)
  end

  def current_user(request)
    User.find_by_id(request.session[:user_id])
  end
  #Create a mentor_id and student_id in the Users table to differentiate the type of user? #
end