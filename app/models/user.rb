class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :submissions
  has_many :comments
  
  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end
end
