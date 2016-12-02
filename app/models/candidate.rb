class Candidate < ApplicationRecord

    has_one :posting
    belongs_to :candidate, class_name: 'User', primary_key: 'id'

    mount_uploader :photo, PictureUploader

end
