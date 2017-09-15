class CreateLikeProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :like_projects do |t|
      t.string :github_project_id
    end
  end
end
