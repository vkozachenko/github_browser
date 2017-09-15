class LikeUser< ActiveRecord::Base
  
  validates :github_user_id, presence: true, uniqueness: true

  def self.like_user?(id)
    LikeUser.find_by_github_user_id(id).present?
  end

  def self.like_user(id)
    LikeUser.create(github_user_id: id)
  end

  def self.unlike_user(id)
    LikeUser.find_by_github_user_id(id).destroy
  end

end
