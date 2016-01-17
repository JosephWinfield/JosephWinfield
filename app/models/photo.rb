class Photo < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  validates :url, presence: true
end
