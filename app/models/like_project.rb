class LikeProject < ActiveRecord::Base
  validates :github_project_id, presence: true, uniqueness: true

  def self.like_project?(id)
    LikeProject.find_by_github_project_id(id).present?
  end

  def self.like_project(id)
    LikeProject.create(github_project_id: id)
  end

  def self.unlike_project(id)
    LikeProject.find_by_github_project_id(id).destroy
  end

end
