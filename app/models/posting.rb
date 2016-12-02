class Posting < ApplicationRecord

  belongs_to :cand_info, class_name: 'Candidate', primary_key: 'id'
  has_many :recruits

end
