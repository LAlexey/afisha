class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :roles

  serialize :roles, Array

  def admin?
    has_role(:admin)
  end

  def has_role(role)
    self.roles && self.roles.include?(role.to_s)
  end
end
