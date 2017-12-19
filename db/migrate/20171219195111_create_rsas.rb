class CreateRsas < ActiveRecord::Migration[5.1]
  def change
    create_table :rsas do |t|

      t.timestamps
    end
  end
end
