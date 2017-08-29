class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lastseenable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  scope :online, -> {where("last_seen > ?", 10.minutes.ago)}

  def name
    email.split('@')[0]
  end
  
end
