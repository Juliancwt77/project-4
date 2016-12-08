class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_one :candidate, foreign_key:'individual_id'

has_many :recruits, foreign_key: 'company_id'

has_one :cand_posting, through: :candidate, source: :posting

has_many :company_offer, through: :recruits, source: :posting

validates :user_type, presence: true
validates :name, length: { maximum: 25 }
validates :username, length: { maximum: 18 }
validates :company_name, length: { maximum: 25 }

end
