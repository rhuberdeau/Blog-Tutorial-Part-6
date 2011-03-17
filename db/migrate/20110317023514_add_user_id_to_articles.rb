class AddUserIdToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.integer :user_id, :null => false, :options =>
      "CONSTRAINT fk_article_users REFERENCES users(id)"
    end
  end

  def self.down
    remove_column :articles, :user_id
  end
end
