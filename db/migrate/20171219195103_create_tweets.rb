class CreateTweets < ActiveRecord::Migration[5.1]
 def change
    create_table :tweets do |t|
      t.integer :rsaid
      t.text :tweet

      t.timestamps
    end
end
end
