class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :tweets, :dependent => :destroy
  has_many :followships
  has_many :followings, :through => :followships
  
  has_many :blockships
  has_many :blockings, :through => :blockships
  
  def follow(user)
	  	followship = followships.build(:following_id => user.id)
  	  if !followship.save
  	    logger.debug "User '#{user.email}' already exists in the user's list."
  	  end
  end

  def unfollow(user)
      followship = self.followships.where(following_id: user.id).first
      if followship
        followship.destroy
      end
  end

  def unfollow(user)
      followship = self.followships.where(following_id: user.id).first
      if followship
        followship.destroy
      end
  end

  def block(user)
    blockship = blockships.build(:blocked_id => user.id)
    blockship2 = blockships.build(:user_id =>user.id, :blocked_id => self.id)
    if !blockship.save
      logger.debug "User '#{user.email}' already exists in the user's blocked list."
    end
    if !blockship2.save
      logger.debug "User '#{user.email}' already exists in the user's blocked list."
    end
  end

  def is_following(user)
    return self.followings.include? user
  end

  def is_blocked(user)
    return self.blockings.include? user
  end

  def all_tweets
  	Tweet.where("user_id in (?)", followings.map(&:id).push(self.id))
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
