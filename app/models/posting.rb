class Posting < ApplicationRecord

  # belongs_to :cand_info, class_name: 'Candidate', primary_key: 'id'

  belongs_to :candidate, foreign_key: 'cand_info_id'

  has_many :recruits

end
