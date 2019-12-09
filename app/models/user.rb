class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, class_name: 'Booking'
  has_many :rooms, class_name: 'Room', through: :bookings

  validates :first_name, :last_name, :phone_number, presence: true
  validates :phone_number, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
end
