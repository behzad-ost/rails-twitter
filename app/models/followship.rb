class Followship < ActiveRecord::Base
	belongs_to :user
	belongs_to :following, :class_name => 'User'
	validates_uniqueness_of :following_id, :scope => :user_id
	validates_presence_of :user_id, :following_id
end
