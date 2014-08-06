class Song < ActiveRecord::Base
  mount_uploader :name, SongUploader
end
