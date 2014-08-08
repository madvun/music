class Song < ActiveRecord::Base
  belongs_to :user
  VALID_MUSIC_REGEX = /\A[^&]+.mp3$|.waw$|.ogg$+\z/i
  validates :name, presence: true,
            format: { with: VALID_MUSIC_REGEX }
  validates :file, presence: true
  mount_uploader :file, SongUploader
end
