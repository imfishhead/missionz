class Blessing < ActiveRecord::Base
	scope :solved, -> { where(solved: true) }
	scope :unsolved, -> { where(solved: false) }
	mount_uploader :photo, AvatarUploader

	validates :nickname, presence: true
	validates :content, presence: true
	validates :question, presence: true
end
