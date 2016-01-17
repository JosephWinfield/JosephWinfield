class Photo < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  validates :photo, presence: true


end
