class Candidate < ApplicationRecord

    has_one :posting
    # has_one :posting, foreign_key: 'cand_info_id'

    belongs_to :individual, class_name: 'User', primary_key: 'id'
    # belongs_to :candidate, class_name: 'User', primary_key: 'id'

    # belongs_to :cand/individual!!!!!, class_name: 'User', primary_key: 'id'
    # belongs_to :cand, class_name: 'User', primary_key: 'id' - as discussed with Amanda

    mount_uploader :photo, PictureUploader

    validates :title, length: { maximum: 25 }, presence: true
    validates :language, presence: true
    validates :description, length: { maximum: 500 }, presence: true
    validates :rate, numericality: { only_integer: true }, presence: true

end
