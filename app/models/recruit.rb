class Recruit < ApplicationRecord

  belongs_to :posting
  belongs_to :company, class_name: 'User', primary_key: 'id'

end
