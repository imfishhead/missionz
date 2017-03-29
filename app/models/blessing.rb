class Blessing < ActiveRecord::Base
	mount_uploader :photo, AvatarUploader
end
