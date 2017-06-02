class Blockship < ActiveRecord::Base
	belongs_to :user
	belongs_to :blocked, :class_name => 'User'
	validates_uniqueness_of :blocked_id, :scope => :user_id
	validates_presence_of :user_id, :blocked_id
end
