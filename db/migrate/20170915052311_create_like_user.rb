class CreateLikeUser < ActiveRecord::Migration[5.1]
  def change
    create_table :like_users do |t|
      t.string :github_user_id
    end
  end
end
