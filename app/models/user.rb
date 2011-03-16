class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_and_belongs_to_many :roles
  
  def role?(role)
   return !!self.roles.find_by_name(role.to_s)
  end
  
  before_create :setup_role
  private
  def setup_role
    if self.role_ids.empty?
      self.role_ids = [3]
    end
  end
end
