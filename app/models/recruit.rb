class Recruit < ApplicationRecord

  belongs_to :posting
  belongs_to :company, class_name: 'User', primary_key: 'id'

  validates :scope, length: { maximum: 250 }, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end
