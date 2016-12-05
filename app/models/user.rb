class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_one :candidate, foreign_key:'candidate_id'

has_many :recruits, foreign_key: 'company_id'

has_one :cand_posting, through: :candidate, source: :posting

has_many :company_offer, through: :recruits, source: :posting

end
