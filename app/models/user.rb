class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates :nickname, presence: true
  validates :password, format: { with: PASSWORD_REGEX }
  validates :user_check_id, numericality: { other_than: 1, message: "can't be blank" }

  has_many :items
  has_many :orders
  has_one :my_page
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_check

end
