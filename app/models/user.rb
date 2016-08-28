class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :mentors
  has_many :students
  has_many :admins
  has_one :profile

  USER_ROLES = {
    admin: 'Administration',
    mentor: 'Mentor',
    student: 'Student'
  }

  def admin?
    self.role == 'admin'
  end

  def mentor?
    self.role == 'mentor'
  end

  def student?
    self.role == 'student'
  end

  def page_title
    return USER_ROLES[self.role.to_sym]
  end

end
