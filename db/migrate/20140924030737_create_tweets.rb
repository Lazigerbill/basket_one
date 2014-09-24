class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :username
      t.string :profile_img_url
      t.string :text
      t.datetime :tweet_created_at
      t.datetime :created_at

      t.timestamps
    end
  end
end
