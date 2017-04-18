class Photo < ActiveRecord::Base
  mount_uploader :url, PhotoUploader

  validates :url, presence: true
end
