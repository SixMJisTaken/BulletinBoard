class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username , presence: true 
  validates :email , presence: true , uniqueness: true
  validates :password , presence: true , confirmation: true
  validates :password_confirmation , presence: true
  validates :phone , presence: true , numericality: { only_integer: true }
end
