class Posting < ApplicationRecord

  belongs_to :candidate
  has_many :recruits

end
